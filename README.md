# Hexo Docker  


## Description  

Hexo 博客的Docker镜像  

## Usage
  
- GITHUB_DEPLOY_KEY github的部署应用设置的key  
- AUTO_DEPLOY_WEB_HOOK_PORT 自动部署hexo blog的webhook地址 ***默认为14000***   
- AUTO_DEPLOY_WEB_HOOK_HASHKEY  自动部署hexo blog的webhoook设置的hashkey    
- GITHUB_REMOTE_ADDR github的远程地址    


## Startup  
  
```  
docker run \
	--name my_blog -d \
	-p 4000:4000 \
	-p 14000:14000 \
	-p 12222:22 \
	-e GITHUB_DEPLOY_KEY='' \
	-e AUTO_DEPLOY_WEB_HOOK_PORT='14000' \
	-e AUTO_DEPLOY_WEB_HOOK_HASHKEY='' \
	cloudcube/hexo  
```  
## Link  

