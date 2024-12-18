import os
import re
import copy

SRC_ROOT_DIR = os.environ.get("GRASP_SRC_DIR",'.')
DEFINITIONS_SUBDIR = os.path.join(
    'asp_recipe_graphs','asp','domain_independent')
DOMAINS_SUBDIR = os.path.join(
    'asp_recipe_graphs','asp','domains')
DEFINITIONS_DIR = os.path.join(
    SRC_ROOT_DIR,DEFINITIONS_SUBDIR)
DOMAINS_DIR = os.path.join(
    SRC_ROOT_DIR,DOMAINS_SUBDIR)
SHOW_SUBDIR = os.path.join(
    'asp_recipe_graphs','asp','show')
SHOW_DIR = os.path.join(
    SRC_ROOT_DIR, SHOW_SUBDIR)
RECIPES_SUBDIR = os.path.join(
    'asp_recipe_graphs','asp','recipes')
RECIPES_DIR = os.path.join(
    SRC_ROOT_DIR, RECIPES_SUBDIR)

MODULE_FILES = [
    f for f in os.listdir(DEFINITIONS_DIR) \
        if os.path.isfile(os.path.join(DEFINITIONS_DIR, f)) and f[0] != '.' ]

MODULES = [
    f.split('.')[0] for f in MODULE_FILES ]
MODULES_FILEMAP = { m:f for m,f in zip(MODULES,MODULE_FILES) }

DOMAIN_FILES = [
    f for f in os.listdir(DOMAINS_DIR) \
        if os.path.isfile(os.path.join(DOMAINS_DIR, f)) and f[0] != '.' ]

def get_module_path(
        module, src_root_dir=SRC_ROOT_DIR,
        definitions_subdir=DEFINITIONS_SUBDIR,
        modules_filemap=MODULES_FILEMAP):
    fname = modules_filemap[module]
    return os.path.join(src_root_dir, definitions_subdir, fname)


# Regular expressions used to find what terms are defined
# and which are used in the modules.
ASP_MODULE_DEFINES = {}
ASP_MODULE_USES = {}
RE_FIND_TERMS = re.compile('(?=(?:^|\W|\(|\))([a-z][a-z_]*)\([a-zA-Z][a-zA-Z0-9_,()]*\))')
RE_IS_DEFINITION = re.compile('^([a-z][a-z_]*)\([a-zA-Z0-9_," ]*\)(?: :-|\.)')

print(f"MODULES = {MODULES}")
for m in MODULES:
    fpath = get_module_path(m)
    defines = set([])
    uses = set([])
    with open(fpath,'r') as ifile:
        for line in ifile.readlines():
            def_term_matches = \
                RE_IS_DEFINITION.findall(line)
            if len(def_term_matches) > 0:
                defines.add(def_term_matches[0])
            using = RE_FIND_TERMS.findall(line)
            uses |= set(using)
    uses -= defines
    ASP_MODULE_DEFINES[m] = defines
    ASP_MODULE_USES[m] = uses

# The dependency map determines which modules depend (directly)
# on which others. See get_all_dependencies for the full list
# of module dependencies
DEPENDENCY_MAP = { }
for m in MODULES:
    depends = set()
    uses = ASP_MODULE_USES[m]
    for m_alt in MODULES:
        if m != m_alt:
            alt_defines = ASP_MODULE_DEFINES[m_alt]
            for term in uses:
                if term in alt_defines:
                    depends.add(m_alt) 
    DEPENDENCY_MAP[m] = depends

# we also get a set of all defined terms, all used terms and
# all undefined terms that are used
ALL_DEFINED = set(
    [t for m, defines in ASP_MODULE_DEFINES.items() for t in defines])
ALL_USES = set(
    [t for m, uses in ASP_MODULE_USES.items() for t in uses])
UNDEFINED_TERMS = ALL_USES - ALL_DEFINED


# functions to get dependency structure
def get_dependencies(
        specified, dependency_map=DEPENDENCY_MAP, mode='full'):
    """
    parameters
    ----------
    specified : a collection of named modules which you specify you
        are using
    dependency_map : the dependency map you are using
    mode : whether you want a full set of dependencies or just direct
    
    returns
    -------
    required : an extended collection of named modules including
        dependencies
    """
    if mode == 'full':
        to_load = copy.copy(specified)
        required = set()
        while len(to_load) > 0:
#            print(f"to_load = {to_load}")
#            print(f"specified = {specified}")
            loading = to_load.pop(0)
            to_load.extend(dependency_map.get(loading,[]))
            required.add(loading)
    elif mode == 'direct':
        required = set()
        for m in specified:
            required |= dependency_map[s]
    else:
        raise ValueError(f'mode {mode} not recognised')
    return required
            
def what_defines(term, asp_module_defines=ASP_MODULE_DEFINES):
    """
    Return the module name that defines a term, or None if not found.
    """
    for m, defines in asp_module_defines.items():
        if term in defines:
            return m
    return None


def what_uses(term, asp_module_uses=ASP_MODULE_USES):
    """
    Return all module names that use a given term directly. 
    """
    modules = []
    for m, uses in asp_module_uses.items():
        if term in uses:
            modules.append(m)
    return modules

