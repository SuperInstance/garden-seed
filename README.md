# Garden Seed

The tender. Watches a family of repos, waters the growing ones, prunes the dead.

Scans a directory of git repos. Reports: which are alive (commits in 7 days),
which are sleeping (7-30 days), which are dead (30+ days). The tender doesn't
delete — it reports. Pruning is a captain's decision.

## Use

```bash
./tend.sh /path/to/family     # health report for every repo underneath
```
