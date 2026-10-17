## Getting Started

### Required Tools
TODO

### Workspace Initialization
1. Create a Python virtual environment: 
    ```
    python3 -m venv .venv
    ```

2. Activate the virtual environment:
    * Windows (PowerShell):
        ```
        .\.venv\Scripts\Activate.ps1
        ```

    * Linux/Mac
        ```
        source .venv/bin/activate
        ```

3. Run the following commands:
    ```
    pip install west
    west init -m https://github.com/theta-machines/zephyr-bsp
    west update --narrow -o=--depth=1
    ```

4. Install Zephyr's Python dependencies:
    * Windows (PowerShell):
        ```
        python -m pip install @((west packages pip) -split ' ')
        ```
    
    * Linux/Mac
        ```
        west packages pip --install
        ```

5. Run the following commands:
    ```
    west zephyr-export
    west sdk install -t arm-zephyr-eabi
    west blobs fetch thetamachines
    west blobs fetch hal_nxp --allow-regex 'IW416/.*'
    ```

### Blinking an LED
1. Build the `blinky` app:
    ```
    west build -p always -b dev_g2_nano/mimxrt1176/cm7 zephyr/samples/basic/blinky
    ```

2. Flash the board:
    ```
    west flash
    ```