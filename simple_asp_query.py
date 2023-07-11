from asp_recipe_graphs.api.queries import QUERIES
from asp_recipe_graphs.api.recipes import RECIPES
from asp_recipe_graphs.api.solver import load_and_solve_recipes

def main(query=None, recipe=None):
    models = load_and_solve_recipes(
        query, [recipe])
    print(f"models = {models}")


def create_parser():
    description= """
        Provides functionality to run simple ASP queries with a simple interface"""
    parser = argparse.ArgumentParser(
        prog='simple_asp_query',
        description=description,
        epilog='See git repository readme for more details.')

    query_options = QUERIES
    parser.add_argument('--query', '-q', type=str, choices=query_options,
        help='What query do you wish to make?')
    recipe_options = RECIPES
    parser.add_argument('--recipe', '-r', type=str, choices=recipe_options,
        help='Which recipe would you like to query?')

#    options = [
#        'create_database', 'drop_tables', 'create_tables', 'insert_recipes',
#        'insert_ingredients', 'insert_constituents', 'insert_instructions',
#        'insert_equipment', 'create_ingredient_counts',
#        'filter_ingredient_names', 'filter_recipes',
#        'create_all']
#    # dropping tables
#    parser.add_argument('--tables-to-drop', type=str,
#        help='For option: drop_tables. Comma separated list of tables to drop')
#    parser.add_argument('--exclude-tables-to-drop', type=str,
#        help='For option: drop_tables. Comma separated list of tables not to drop')
#    parser.add_argument('--force-drop',action='store_true',
#        help='Force drop tables call on all tables, even if errors encountered?')
#    # creating tables
#    parser.add_argument('--tables-to-create', type=str,
#        help='For option: create_tables. Comma separated list of tables to create')
#    parser.add_argument('--exclude-tables-to-create', type=str,
#        help='For option: create_tables. Comma separated list of tables to create')
#    parser.add_argument('--force-create',action='store_true',
#        help='Force create tables call on all tables, even if errors encountered?')
#    # inserting recipes
#    parser.add_argument('--input-subdir', type=str, default='processed',
#        help='Input subdirectory for data')
#    parser.add_argument('--max-ifile-id', type=int, default=15,
#        help='Maximum input file id for processing')
#    parser.add_argument('--min-ifile-id', type=int, default=1,
#        help='Minimum input file id for processing')
    
    return parser

if __name__ == '__main__':
    import argparse
    args = create_parser().parse_args()
    main(**vars(args))    

