from mega_calculator.parser import create_parser
from mega_calculator.operation import do_operation


if __name__ == "__main__":
    parser = create_parser()
    args = parser.parse_args()

    result = do_operation(args.operation, args.values)
    print(f"{result}")
