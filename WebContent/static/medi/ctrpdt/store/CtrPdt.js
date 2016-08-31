Ext.define('medi.ctrpdt.store.CtrPdt', {
	extend: 'Ext.data.Store',
	model: 'medi.ctrpdt.model.CtrPdt',
	proxy: {
		url: 'medi-ctr/ctrpdt/list',
		type: 'ajax',
		reader: {
			type: 'json',
			rootProperty: 'data',
			messageProperty: 'message'
		}
	}
});