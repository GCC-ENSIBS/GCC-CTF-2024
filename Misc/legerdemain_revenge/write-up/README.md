# **Legerdemain** Writeup

We initialize our strings:

```python
(z:="debug list")
(w:="vars")
```

And we remake the dictionary but with ``debug list`` as a pointer pointing to ``vars``

```python
(p:={**p,z:p[w]})
```

> [!NOTE]
> If we were inside a function there would be a new **local** p redefined and our exploit would not work.
>
> Also if we could use ``_`` and ``.`` we could have used this shorter and (in my opinion) cooler exploit:
>
> ```python
> (z:="debug")
> (y:=z.__add__)
> y(" list")
> (w:="vars")
> (x:={z:p[w]})
> (p:={**p,**x})
> ```

Don't hesitate to share your exploits!

