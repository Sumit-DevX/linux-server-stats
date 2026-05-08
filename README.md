# linux-server-stats
A simple shell script that provides Linux server stats

## Prerequisites
- Ensure you are running this on a Linux machine.
- You need a terminal emulator.

## Usage Instructions

1. Open your Linux terminal.

2. Navigate to the directory where you downloaded the file:
   ```bash
   cd /path/to/downloaded/directory
   ```

3. Check the file permissions:
   ```bash
   ls -l server-stats.sh
   ```
   The output should show executable permissions, like: `-rwxrw-r-- 1 user user ... server-stats.sh`

   If it shows `-rw-` (no 'x'), grant execute permission:
   ```bash
   sudo chmod u+x server-stats.sh
   ```

4. Run the script:
   ```bash
   ./server-stats.sh
   ```
   This will display your Linux server statistics.