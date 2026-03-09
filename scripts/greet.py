#!/usr/bin/env python3
"""Greet script — example second entry point."""

import sys

from src.greeting import format_greeting


def main() -> int:
    name = sys.argv[1] if len(sys.argv) > 1 else "World"
    print(format_greeting(name))
    return 0


if __name__ == "__main__":
    sys.exit(main())
