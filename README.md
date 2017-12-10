an example of command to run this image is shown below.


```docker run -it --rm -p 8080:80 gorogoroyasu/jupyter-php-docker:0.1 /bin/bash```
and inside of container,
```jupyter-notebook --port 80 --ip 0.0.0.0 --allow-root &```

when you access to localhost:8080, you can see your jupyter notebook with PHP7.1.

Q&A:  
password?  
when you start jupyter notebook with the command shown above,  
something like  
```
http://0.0.0.0:80/?token=abcdefghijklmnopqrstu  
```
will appear.  
then, you can login jupyter notebook with URL:  

```
http:localhost:8080/?token=abcdefghijklmnopqrstu  
```
enjoy your PHP life!
