import argparse


def create_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="The mega calculator. Do maths with mega power !"
    )

    subparsers = parser.add_subparsers(help="operation help", dest="operation")

    add_op = subparsers.add_parser("add")
    add_op.add_argument("values", help="list of values to use", type=float, nargs="+")

    sub_op = subparsers.add_parser("sub")
    sub_op.add_argument("values", help="list of values to use", type=float, nargs="+")

    mul_op = subparsers.add_parser("mul")
    mul_op.add_argument("values", help="list of values to use", type=float, nargs="+")

    div_op = subparsers.add_parser("div")
    div_op.add_argument("values", help="list of values to use", type=float, nargs="+")

    return parser
