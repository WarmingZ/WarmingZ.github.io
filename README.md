# Soloviov blog
Hello, this is my blog that was made on Jekyll and runs on github pages.

***

In order to run it locally on your computer, you need to install `Docker` and the VSCode `Dev Containers` plugin.

Next, open the cloned project and right-click on the dockerfile and at the very end you will have the item `Build Image`.

After that, use the combination Control + Shift + P to enter the command menu and write `Open folder in Container`, and after extracting the project folder, in Docker you will have a new container with this site.

![Docker](/statick/image/Docker.png)

***

## Why docker and Jekyll Deploy Action

Because it often happens that `Jekyll` versions don't match `Ruby` versions and so on. To avoid a situation with errors, it is very convenient to use Docker. 

#### Jekyll Deploy Action

Also, this site is configured for [Jekyll Deploy Action](https://github.com/jeffreytse/jekyll-deploy-action). 

This was done in order to make my site look exactly the way it looks locally. That is, in fact, I compile it locally on the computer and send the finished assembly to github, bypassing the assembly from GitHub itself.

This allows me to install any plugins and use the latest version of `Jekyll` because GitHub Pages has its own version [dependencies](https://pages.github.com/versions/).


Therefore, if you want to use JEKYLL DEPLOY ACTION, you need:

- Create a Personal Access Token with custom permissions and copy the value.
- Go to your repository’s Settings and then switch to the Secrets tab.
- Create a token named GH_TOKEN (important) using the value copied.

In the end, go to your repository’s Settings and scroll down to the GitHub Pages section, choose the `gh-pages` branch as your GitHub Pages source. 

Or go to the [Jekyll Deploy Action page](https://github.com/jeffreytse/jekyll-deploy-action) for detailed instructions.