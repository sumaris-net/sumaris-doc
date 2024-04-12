## Exemple avec un fichier markdown

Vous pouvez aussi inclure vos graphiques dans les **fichiers markdown**

```html
<section data-markdown="demo-chart.md">    
</section>
```

<div style="height:300px">
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