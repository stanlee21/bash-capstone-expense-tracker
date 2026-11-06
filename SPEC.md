# depenses: specification

## In one sentence

depenses is a tool that helps me track my personal monthly budget to see exactly where my money goes each month directly from my terminal.

## Who will use it, and when?

Me and my team members, every time we buy something or pay a bill, to record expenses instantly and prevent unorganized tracking.

## Commands

### Help / Usage info

```bash
$ ./tracker.sh
Usage: ./tracker.sh {add|list|delete|help}
  add AMOUNT CATEGORY [NOTE]
  list
  delete ID
```

### Add command

```bash
$ ./tracker.sh add 1500 transport "moto"
Success: Added $1500 to transport (ID: 20261106141025)
```

### List command

```bash
$ ./tracker.sh list
ID              DATE        TIME   AMOUNT   CATEGORY    NOTE
--------------------------------------------------------
20261106141025  2026-11-06  14:10  1500     transport   moto
```

### Delete command

```bash
$ ./tracker.sh delete  6678
Success: Deleted expense ID  6678
```

## The data file

The data is saved inside a simple flat-text database file located at `./data/expenses.csv`. Each field is cleanly separated by a comma (`,`) character.

Three example lines:
```
    6678,2026-11-06 14:54,300,food,supper
4   033,2026-11-06 14:56,600,Transport,to rebase
    1927,2026-11-06 14:56,500,Transport,to church
```

## Errors I will handle

- What happens if the user leaves out `AMOUNT` or `CATEGORY` when adding → the tool prints `"Error: You must provide both an AMOUNT and a CATEGORY!"` and exits with 1.
- What happens if the user runs the delete command without an item ID → the tool prints `"Error: Please specify the ID you want to delete!"` and exits with 1.
- What happens if the user tries to delete an ID that does not exist → the tool prints `"Error: ID <TARGET_ID> was not found!"` and exits with 1.

## My plan (slices, in order)

1. Skeleton: Create `tracker.sh` entry point routing layer, build help usage outputs, and auto-initialize the data directory structure.
2. Add Slice: Create `lib/add.sh` to generate timestamps, build unique transaction IDs, parse incoming variables, and append rows into the tracking text file.
3. List Slice: Create `lib/list.sh` to parse file elements cleanly and layout values using column text formatting tags.
4. Delete Slice: Create `lib/delete.sh` using `awk` stream exclusions to remove targeted unique record strings cleanly and safely.
