var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}
function callOnLoad(init)
{
    if (window.addEventListener)
    {
        window.addEventListener("load", init, false);
    }
    else if (window.attachEvent)
    {
        window.attachEvent("onload", init);
    }
    else
    {
        window.onload = init;
    }
}
