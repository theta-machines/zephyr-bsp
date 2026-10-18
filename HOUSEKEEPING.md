# Repository Housekeeping
This document is for the maintainers of this repository itself. It provides general housekeeping instructions.

## Upgrading Zephyr Version
Below is a checklist of actions to be completed when upgrading to a newer Zephyr version.

1. Update the `west.yml` file.
    * Point to the new Zephyr version.

2. Create a clean environment using the `west-minimal.yml` manifest.
    * This step is to ensure all required packages are included in the `west-minimal.yml` file.

3. Revisit each patch in `zephyr/patches/` and update the `zephyr/patches.yml` file.
    * Is each patch still necessary?
    * Does each patch still cleanly fix a problem?
    * Are any new patches required to run the samples described below?
    * If on Windows, make sure new patch files have the correct line endings:
        ```PowerShell
        (Get-Content "path/to/file.patch" -Raw) -replace "`r`n", "`n" | Set-Content "path/to/file.patch" -NoNewline
        ```

4. Rerun every sample that is listed as "Officially Tested".
    * Make sure the user experience is smooth.



## Maintaining Patches
### No Patches
When no patches need to be applied, the `zephyr/patches.yml` file should contain no entries under `patches`:
```yaml
# zephyr/patches.yml
patches:
# End of file
```

### Example Patch Entry
Here's an example patch entry in the `zephyr/patches.yml` file:
```yaml
patches:
  - path: uart_mcux_lpuart.c.patch
    sha256sum: 505a2ef48fe14ae9d71c4b4a8d32b08cafba1ace90e380280ecbbc14739ca9c6
    module: zephyr
    author: Ryan Stracener
    email: ryan.stracener@thetamachines.com
    date: 2026-10-18
```

### Generating the `sha256sum`
#### Linux/Mac
```sh
sha256sum path/to/file.patch
```

#### Windows (PowerShell)
Be cautious of line endings! CRLF line endings will change the hash value!
```powershell
(Get-FileHash path/to/file.patch).Hash.ToLower()
```



## Updating the CMSIS Pack
The CMSIS pack used by pyOCD is fetched as a blob. To update the pack version, modify the `zephyr/module.yml` file.
* Update the `version` and `url` values to the latest release.
* Update the `sha256` value (using the method described above).
* Confirm the license is correct in `zephyr/blobs/licenses/MIMXRT1171_DFP.txt`
    * The license file is inside the `.pack` file itself.
    * To open the `.pack` file, simply rename the file to `.zip`.
    * In the `.pack` file, look for `License.txt` (or similar).
