$D = YAHOO.util.Dom;
$E = YAHOO.util.Event;
var yuiLoadingPanel = function(conf){
    conf = conf == undefined ? new Array() : conf;
    conf.id = conf.id == undefined ? 'yuiLoadingPanel':confi.id;
    conf.header = conf.header == undefined ? 'Loading, please wait...':conf.header;
    conf.width = conf.width == undefined ? '240px':conf.width;
    this.conf = conf;
    this.cancelEvent = new YAHOO.util.CustomEvent("cancelEvent", this);
    this.init();
	
};

yuiLoadingPanel.prototype = {
    init:function(){
        var loadingPanel = new YAHOO.widget.Panel(this.conf.id,{
            width:this.conf.width,
	    fixedcenter:true,
            close:false,
            draggable:false,
            modal:true,
            visible:false
        });
       
       var headerDiv = document.createElement('div');
       loadingPanel.setBody(headerDiv);
       var img = document.createElement('img');
       img.src = "../images/rel_interstitial_loading.gif";
       loadingPanel.appendToBody(img);
       loadingPanel.render(document.body);
       $D.addClass(loadingPanel.id, 'tcc_lightboxLoader');
       var cancelLink = document.createElement('a');
       $D.setStyle(cancelLink, 'cursor', 'pointer');
       cancelLink.appendChild(document.createTextNode(''));
       $E.on(cancelLink, 'click', function(e, o){
           o.self.loadingPanel.hide();
           o.self.cancelEvent.fire();
       }, {self:this});
       loadingPanel.appendToBody(document.createElement('br'));
       loadingPanel.appendToBody(cancelLink);
       $D.setStyle(loadingPanel.body, 'text-align', 'center');
        $D.addClass(document.body, 'yui-skin-sam');
        this.headerDiv = headerDiv;
        this.cancelLink = cancelLink;
        this.loadingPanel = loadingPanel;
        this.setHeader(this.conf.header);
    },
    setHeader:function(text){
      while(this.headerDiv.firstChild){
         this.headerDiv.removeChild(this.headerDiv.firstChild);
      }
      this.headerDiv.appendChild(document.createTextNode(text));
    },
    show:function(text){
        if(text != undefined){
            this.setHeader(text);
        }else{
	    this.setHeader(this.conf.header);
	}
	this.loadingPanel.show();
    },
    hide:function(){
        this.loadingPanel.hide();
    }
};