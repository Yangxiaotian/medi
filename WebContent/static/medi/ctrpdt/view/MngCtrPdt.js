Ext.define('medi.ctrpdt.view.MngCtrPdt', {
	extend: 'Ext.panel.Panel',
	layout: {
		type: 'hbox',
		align: 'stretch'
	},
	viewModel: {
		data: {
			auth: {
				create: false,
				update: false,
				'delete': false
			},
			rec: null
		}
	},
	initComponent: function() {
		var me = this;
		me.orgTreeView = Ext.create('bmc.core.org.view.OrgTreeView', {
			fullTree: Bmc.User.getMyUid() == 'admin',
			collapsible: true,
			expandRoot: true,
			width: 300,
			listeners: {
				selectionchange: function(scope, recs){
					if(recs[0]){
						me.gridView.changeOrg(recs[0].get('ono'));
					}
				}
			}
		});	
		me.gridView = Ext.create('gyfc.house.view.LandUseGrid',{
			listeners: {
				selectionchange: function(scope, selected) {
					me.getViewModel().set('rec', selected[0]);
				}
			},
			flex: 1,
			tbar: [{
				text:'刷新',
				iconCls: 'c-btn-refresh',
				handler: function() {
					me.gridView.store.load();
				}
			},'-',{
				text: '新增',
				iconCls: 'c-btn-create',
				bind: {
					disabled: '{!auth.create}'
				},
				handler: function(){
					var r = Ext.create('medi.ctrpdt.model.CtrPdt', {id: 0});
					me.showWin('新增', r, true);
				}
			}, {
				text: '编辑',
				iconCls: 'c-btn-update',
				bind: {
					disabled: '{!auth.update}'
				},
				handler: function(){
					var r = me.getViewModel().get('rec');
					if(r){
						me.showWin('编辑用户信息', r, false);
					}
				}
			}, {
				text: '删除',
				iconCls: 'c-btn-delete',
				bind: {
					disabled: '{!auth.delete}'
				},
				handler: function(){
					var r = me.getViewModel().get('rec');
					Ext.Msg.confirm('删除提示', Ext.String.format('确定删除该对照品？', r.get('id')), function(btn){
						if(btn == 'yes'){
							Gyfc.LandUse.deleteLandUsed(r.get('id'), function(){
								me.gridView.store.remove(r);
							});
						}
					});
				}
			}
			],
		});
		me.items = [me.orgTreeView, me.gridView];
		me.callParent(arguments);
	},
	//显示
	showWin: function(title, rec, add){
		var me = this;
		var form = Ext.create('medi.ctrpdt.view.CtrPdtView', {
			viewModel: {
				data: {
					rec: rec 
				}
			}
		});
		var win = Ext.create('bmc.common.comp.EntityWindow', {
			title: title,
			form: form,
			width: 600,
			height: 500,
			cb: function(){
				if(add){
					me.gridView.store.insert(0, rec);
				}
			},
			listeners: {
				reject: function(){
					rec.reject();
				}
			}
		});
		win.show();
	}
});