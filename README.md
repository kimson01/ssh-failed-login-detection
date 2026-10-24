# SSH Failed Login Detection and Investigation

## Overview

A hands-on blue-team project focused on monitoring SSH authentication activity on Linux systems.

The project includes Bash scripts for identifying failed SSH password attempts and investigating authentication, session, and SSH service events.

## Objectives

* Identify repeated failed SSH password attempts.
* Summarize observed source IPv4 addresses.
* Review successful and failed authentication events.
* Examine relevant SSH session events.
* Document suspicious activity using a structured incident report.
* Practise evidence-based security investigation.

## Environment

* Operating system: Kali Linux
* Shell: Bash
* Log source: systemd journal for the SSH service
* Tools: journalctl, grep, sort, uniq, systemctl

## Project Structure

* `scripts/detect-ssh-failures.sh` — summarizes failed SSH password attempts by source IPv4 address over a 24-hour period.
* `scripts/ssh-investigate.sh` — reviews selected authentication events, session events, and SSH service status over a one-hour period.
* `tests/` — sanitized test data and reproducible test cases.
* `reports/` — security investigation reports.

## How It Works

The detection script retrieves SSH service journal entries from the previous 24 hours, filters messages containing `Failed password`, extracts matching IPv4 source addresses, and counts their occurrences.

The investigation script reviews successful password and public-key authentication messages, failed authentication events, selected session events, and the SSH service's active state.

## Running the Scripts

Clone the repository, enter the project directory, and review the scripts before executing them.

Run the detection script:

```bash
bash scripts/detect-ssh-failures.sh
```

Run the investigation script:

```bash
bash scripts/ssh-investigate.sh
```

The scripts use `sudo` to access system logs where required. Run them only on systems you own or are authorized to investigate.

## Testing and Validation

Testing documentation will describe the sanitized log samples, expected detection results, actual results, and any identified limitations.

Results must be recorded from actual tests rather than assumed.

## Limitations

* Detection depends on the SSH service journal being available and accessible.
* The current detection script searches for failed-password messages and does not cover every authentication failure type.
* Source address extraction currently supports IPv4 patterns only.
* The scripts do not independently establish that an account was compromised.
* The scripts do not automatically block source addresses or contain incidents.
* The current implementation has not yet been validated against a comprehensive test suite.

## Future Improvements

* Add configurable thresholds for repeated failed attempts.
* Improve handling of empty logs and command errors.
* Add reproducible automated tests using sanitized sample data.
* Improve support for different SSH service names and log formats.
* Explore SIEM integration and alerting.
* Expand detection coverage based on validated test cases.

## Safety and Privacy

Use only authorized systems and sanitized data.

Do not publish passwords, authentication tokens, private keys, personal information, or unredacted logs from systems you do not own.

## Author

Add your preferred professional name and GitHub profile here.
