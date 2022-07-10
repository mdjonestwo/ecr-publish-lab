import subprocess

def get_version(package_name: str) -> str:
    """
    Get the version of a given binary
    """
    try:
        subprocess.run(f"{package_name} --version")
    except subprocess.CalledProcessError as cpe:
        print("There was an issue getting the version for {}: {}".format(package_name cpe))
def main():
    try:
        for process in ["node", "python"]:
            get_version(process)
    except subprocess.CalledProcessError as cpe:
        print("There was a called process error: {}".format(cpe))
    
if __name__ == "__main__":
    main()