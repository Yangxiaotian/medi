Ext.define('medi.util.CtrPdtService', {
	createCtrPdt: function(data, sc, fc) {
		Bmc.Ajax.post(data, sc, fc);
	},
	updateCtrPdt: function(data, sc, fc) {
		Bmc.Ajax.post(data, sc, fc);
	},
	deleteCtrPdt: function(id, sc, fc) {
		Bmc.Ajax.post({id: id}, sc, fc);
	}
}, function(){
	Medi.CtrPdtService = new this();
});