# Practice files

Small files for exercises. The data is made up; nothing here came from a real experiment.

| File | What it is |
| --- | --- |
| `plate_reader.csv` | A pretend plate reader export: 48 wells, one row each. Columns: `well`, `enzyme` (four proteases), `treatment` (`DMSO`, `inhibitor_1uM`, `inhibitor_10uM`, `no_substrate`), `replicate` (1 to 3) and `rfu`, the fluorescence signal. |
| `count_wells.sh` | A four-line shell script that counts the wells per enzyme. Written in [session 2](../sessions/02-shell-setup.md#6-unix-essentials-making-a-csv-answer-questions). |
| `analyze.py` | A Python script that averages the signal per enzyme and treatment and saves a bar chart. Run with `uv` in [session 2](../sessions/02-shell-setup.md#5-python-with-uv). |

Try them from the top folder of the repo:

```
head practice/plate_reader.csv
bash practice/count_wells.sh practice/plate_reader.csv
```
