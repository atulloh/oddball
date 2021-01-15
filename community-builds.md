---
title: Community Builds
nav_order: 400
---

# Community Builds

## Contributing

While I doubt many people will attempt this build, I'd be happy to proven wrong! If you have some build pics you'd like to share:
- create a fork/branch of [the Oddball GitHub Pages branch](https://github.com/atulloh/oddball/tree/gh-pages)
- create a new folder in `assets/builds` named with your name; if you want to use your Reddit username, prefix your username with "u_", e.g. `assets/builds/u_tullonator`
- create a PR for it
- once I merge it, it'll appear under [community builds]({{site.baseurl}}/community-builds) (this page)

## Contibutions

{% for image in site.static_files %}
    {% if image.path contains 'assets/builds' %}
        {% assign image_path_parts = image.path | split: '/' %}
        {% assign next_user = image_path_parts[3] %}
        {% if user != next_user %}
            {% assign user = next_user %}
            {% if user contains 'u_' %}
                {% assign reddit_name = user | slice: 2,99 %}
<h3 style="display: inline;"><a href="https://www.reddit.com/user/{{ reddit_name }}">u/{{ reddit_name }}</a></h3>
            {% else %}
### {{ user }}
            {% endif %}
        {% endif %}    
![image]({{ site.baseurl }}{{ image.path }})
    {% endif %}
{% endfor %}

{% for build in site.builds %}
{% assign paths = build.path | split: "/" %}
{% assign images = build.images | split: ", " %}
{% for image in images %}
![image]({{ site.baseurl }}/{{ paths[0] }}/{{ paths[1] }}/{{ image }})
{% endfor %}
{% endfor %}
