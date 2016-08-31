Ext.define('medi.ctrpdt.model.CtrPdt', {
	extend:'Ext.data.Model',
	idProperty:'id',
	fields:[
		{name: 'id', type: 'int'},
		{name: 'name', type: 'string'},
		{name: 'molecular', type: 'string'},
		{name: 'remark', type: 'string'}
	]
});