# Markdown files

To slide from `.md` files, use:
```html
<section data-markdown="demo.md">  
</section>
```
---

# Chart

Insérez des graphiques [Chart.js](https://www.chartjs.org/) dans vos diapos.

<div style="height:480px">
    <canvas data-chart="line" >
        <!--
        {
         "data": {
            "labels": ["January"," February"," March"," April"," May"," June"," July"],
            "datasets":[
             {
                "data":[65,59,80,81,56,55,40],
                "label":"My first dataset","backgroundColor":"rgba(20,220,220,.8)"
             },
             {
                "data":[28,48,40,19,86,27,90],
                "label":"My second dataset","backgroundColor":"rgba(220,120,120,.8)"
             }
            ]
         }
        }
        -->
    </canvas>
</div>