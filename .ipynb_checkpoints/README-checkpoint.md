# docker-jlab

Builds a docker image and launcher script to facilitate using
Jupyter-lab as an IDE for generating Python packages, modules, test code, and documentation. 
The rationale for using this tool for Python development is to make it easier to build consistent packages and projects and make it easier to move the projects from one machine to another.

[Jupyter-lab](https://jupyter.org/) is integrated with [nbdev](https://nbdev.fast.ai/)
and [Quarto](https://quarto.org/) to make it easier to use Jupyter-lab to build
packages complete with documentation, test and example code.

Creates a Docker image with:

| Function       |            Tools                  | 
|---------------:|-----------------------------------|
**Networking:**  | ifconfig, ping, ssh, rsync, curl  |
**System:**      | sudo, vim, nodejs                 |
**Development:** | Jupyter-lab, NBdev, Quarto, git   |
| | | 

## Installation
1. [Install Docker](https://docs.docker.com/get-docker/) on your system.
2. Compile the Docker image with:
    - `make build`
3. Install `jlab.run` in your `home/use/bin` directory with:
      - `make runner`
  

## Usage
### Start the container
1. Run `jlab.run` to start a new container from the images you just build in step 2.
2. You should get a `bash` shell that looks like this:

---
```
Welcome to the container.
Jupyterlab: To run Jupyter-lab,  Run jlab.sh to start Jupyter-lab and then
            point your browser to localhost:11000/lab and paste in the token.

wright@JLAB:~$
```
---
3. Your container is now running. To start Jupyter-lab type `jlab.sh`.

You will get a bunch of output like this:

<details>
    <summary>Click to see the output from Jlab.sh command.</summary>
<pre>
wright@JLAB:~$ jlab.sh
[I 2023-08-19 17:53:17.918 ServerApp] Package jupyterlab took 0.0000s to import
[I 2023-08-19 17:53:17.925 ServerApp] Package jupyter_lsp took 0.0066s to import
[W 2023-08-19 17:53:17.925 ServerApp] A `_jupyter_server_extension_points` function was not found in jupyter_lsp. Instead, a `_jupyter_server_extension_paths` function was found and will be used for now. This function name will be deprecated in future releases of Jupyter Server.
[I 2023-08-19 17:53:17.928 ServerApp] Package jupyter_server_terminals took 0.0028s to import
[I 2023-08-19 17:53:17.929 ServerApp] Package notebook_shim took 0.0000s to import
[W 2023-08-19 17:53:17.929 ServerApp] A `_jupyter_server_extension_points` function was not found in notebook_shim. Instead, a `_jupyter_server_extension_paths` function was found and will be used for now. This function name will be deprecated in future releases of Jupyter Server.
[I 2023-08-19 17:53:18.754 ServerApp] Package panel.io.jupyter_server_extension took 0.8252s to import
[I 2023-08-19 17:53:18.755 ServerApp] jupyter_lsp | extension was successfully linked.
[I 2023-08-19 17:53:18.757 ServerApp] jupyter_server_terminals | extension was successfully linked.
[I 2023-08-19 17:53:18.760 ServerApp] jupyterlab | extension was successfully linked.
[I 2023-08-19 17:53:18.761 ServerApp] Writing Jupyter server cookie secret to /home/wright/.local/share/jupyter/runtime/jupyter_cookie_secret
[I 2023-08-19 17:53:18.887 ServerApp] notebook_shim | extension was successfully linked.
[I 2023-08-19 17:53:18.887 ServerApp] panel.io.jupyter_server_extension | extension was successfully linked.
[W 2023-08-19 17:53:18.896 ServerApp] WARNING: The Jupyter server is listening on all IP addresses and not using encryption. This is not recommended.
[I 2023-08-19 17:53:18.896 ServerApp] notebook_shim | extension was successfully loaded.
[I 2023-08-19 17:53:18.898 ServerApp] jupyter_lsp | extension was successfully loaded.
[I 2023-08-19 17:53:18.898 ServerApp] jupyter_server_terminals | extension was successfully loaded.
[I 2023-08-19 17:53:18.899 LabApp] JupyterLab extension loaded from /home/wright/miniconda3/lib/python3.11/site-packages/jupyterlab
[I 2023-08-19 17:53:18.899 LabApp] JupyterLab application directory is /home/wright/miniconda3/share/jupyter/lab
[I 2023-08-19 17:53:18.899 LabApp] Extension Manager is 'pypi'.
[I 2023-08-19 17:53:18.901 ServerApp] jupyterlab | extension was successfully loaded.
[I 2023-08-19 17:53:18.901 ServerApp] panel.io.jupyter_server_extension | extension was successfully loaded.
[I 2023-08-19 17:53:18.902 ServerApp] Serving notebooks from local directory: /jlab
[I 2023-08-19 17:53:18.902 ServerApp] Jupyter Server 2.7.1 is running at:
[I 2023-08-19 17:53:18.902 ServerApp] http://localhost:8888/lab?token=e0892595c69798894bd5f253f1b0b227cef302feb59b8707
[I 2023-08-19 17:53:18.902 ServerApp]     http://127.0.0.1:8888/lab?token=e0892595c69798894bd5f253f1b0b227cef302feb59b8707
[I 2023-08-19 17:53:18.902 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2023-08-19 17:53:18.904 ServerApp]

    To access the server, open this file in a browser:
        file:///home/wright/.local/share/jupyter/runtime/jpserver-18-open.html
    Or copy and paste one of these URLs:
        http://localhost:8888/lab? token=e0892595c69798894bd5f253f1b0b227cef302feb59b8707
        http://127.0.0.1:8888/lab?token=e0892595c69798894bd5f253f1b0b227cef302feb59b8707
[I 2023-08-19 17:53:19.102 ServerApp] Skipped non-installed server(s): bash-language-server, dockerfile-language-server-nodejs, javascript-typescript-langserver, jedi-language-server, julia-language-server, pyright, python-language-server, python-lsp-server, r-languageserver, sql-language-server, texlab, typescript-language-server, unified-language-server, vscode-css-languageserver-bin, vscode-html-languageserver-bin, vscode-json-languageserver-bin, yaml-language-server
</pre>
</details>

4. Next, Scroll through the output, find and copy the "token".  It should look like this:
`e0892595c69798894bd5f253f1b0b227cef302feb59b8707`

5. Open your browser and go to the url: `localhost:11000`
6. Paste the token into the token input dialog near the top.
7. You can now use Jupyter-lab to create, load, run, and save notebooks to your system.

   




