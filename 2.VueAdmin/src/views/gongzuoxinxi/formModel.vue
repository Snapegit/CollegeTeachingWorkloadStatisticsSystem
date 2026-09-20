<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="50%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="岗位名称" prop="gangweimingcheng">
							<el-input class="list_inp" v-model="form.gangweimingcheng" placeholder="岗位名称"
								 type="text" 								:readonly="!isAdd||disabledForm.gangweimingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="工作类型" prop="gongzuoleixing">
							<el-input class="list_inp" v-model="form.gongzuoleixing" placeholder="工作类型"
								 type="text" 								:readonly="!isAdd||disabledForm.gongzuoleixing?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="招聘人数" prop="zhaopinrenshu">
							<el-input class="list_inp" v-model="form.zhaopinrenshu" placeholder="招聘人数"
								 type="text" 								:readonly="!isAdd||disabledForm.zhaopinrenshu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="专业要求" prop="zhuanyeyaoqiu">
							<el-input class="list_inp" v-model="form.zhuanyeyaoqiu" placeholder="专业要求"
								 type="text" 								:readonly="!isAdd||disabledForm.zhuanyeyaoqiu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="学历要求" prop="xueliyaoqiu">
							<el-input class="list_inp" v-model="form.xueliyaoqiu" placeholder="学历要求"
								 type="text" 								:readonly="!isAdd||disabledForm.xueliyaoqiu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="薪资待遇" prop="xinzidaiyu">
							<el-input class="list_inp" v-model="form.xinzidaiyu" placeholder="薪资待遇"
								 type="text" 								:readonly="!isAdd||disabledForm.xinzidaiyu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="工作时间" prop="gongzuoshijian">
							<el-input class="list_inp" v-model="form.gongzuoshijian" placeholder="工作时间"
								 type="text" 								:readonly="!isAdd||disabledForm.gongzuoshijian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="企业名称" prop="qiyemingcheng">
							<el-input class="list_inp" v-model="form.qiyemingcheng" placeholder="企业名称"
								 type="text" 								:readonly="!isAdd||disabledForm.qiyemingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="企业地址" prop="qiyedizhi">
							<el-input class="list_inp" v-model="form.qiyedizhi" placeholder="企业地址"
								 type="text" 								:readonly="!isAdd||disabledForm.qiyedizhi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="联系电话" prop="lianxidianhua">
							<el-input class="list_inp" v-model="form.lianxidianhua" placeholder="联系电话"
								 type="text" 								:readonly="!isAdd||disabledForm.lianxidianhua?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="岗位详情" prop="gangweixiangqing">
							<editor :value="form.gangweixiangqing" placeholder="请输入岗位详情" :readonly="!isAdd||disabledForm.gangweixiangqing?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'gangweixiangqing')"></editor>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'gongzuoxinxi'
	const formName = '工作信息'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		gangweimingcheng : false,
		gongzuoleixing : false,
		zhaopinrenshu : false,
		zhuanyeyaoqiu : false,
		xueliyaoqiu : false,
		xinzidaiyu : false,
		gongzuoshijian : false,
		gangweixiangqing : false,
		qiyemingcheng : false,
		qiyedizhi : false,
		lianxidianhua : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		gangweimingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		gongzuoleixing: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		zhaopinrenshu: [
		],
		zhuanyeyaoqiu: [
		],
		xueliyaoqiu: [
		],
		xinzidaiyu: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		gongzuoshijian: [
		],
		gangweixiangqing: [
		],
		qiyemingcheng: [
		],
		qiyedizhi: [
		],
		lianxidianhua: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			gangweimingcheng: '',
			gongzuoleixing: '',
			zhaopinrenshu: '',
			zhuanyeyaoqiu: '',
			xueliyaoqiu: '',
			xinzidaiyu: '',
			gongzuoshijian: '',
			gangweixiangqing: '',
			qiyemingcheng: '',
			qiyedizhi: '',
			lianxidianhua: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.gangweixiangqing = res.data.data.gangweixiangqing?(res.data.data.gangweixiangqing.replace(reg,'../../../cl72727314/file')):'';
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='gangweimingcheng'){
					form.value.gangweimingcheng = row[x];
					disabledForm.value.gangweimingcheng = true;
					continue;
				}
				if(x=='gongzuoleixing'){
					form.value.gongzuoleixing = row[x];
					disabledForm.value.gongzuoleixing = true;
					continue;
				}
				if(x=='zhaopinrenshu'){
					form.value.zhaopinrenshu = row[x];
					disabledForm.value.zhaopinrenshu = true;
					continue;
				}
				if(x=='zhuanyeyaoqiu'){
					form.value.zhuanyeyaoqiu = row[x];
					disabledForm.value.zhuanyeyaoqiu = true;
					continue;
				}
				if(x=='xueliyaoqiu'){
					form.value.xueliyaoqiu = row[x];
					disabledForm.value.xueliyaoqiu = true;
					continue;
				}
				if(x=='xinzidaiyu'){
					form.value.xinzidaiyu = row[x];
					disabledForm.value.xinzidaiyu = true;
					continue;
				}
				if(x=='gongzuoshijian'){
					form.value.gongzuoshijian = row[x];
					disabledForm.value.gongzuoshijian = true;
					continue;
				}
				if(x=='gangweixiangqing'){
					form.value.gangweixiangqing = row[x];
					disabledForm.value.gangweixiangqing = true;
					continue;
				}
				if(x=='qiyemingcheng'){
					form.value.qiyemingcheng = row[x];
					disabledForm.value.qiyemingcheng = true;
					continue;
				}
				if(x=='qiyedizhi'){
					form.value.qiyedizhi = row[x];
					disabledForm.value.qiyedizhi = true;
					continue;
				}
				if(x=='lianxidianhua'){
					form.value.lianxidianhua = row[x];
					disabledForm.value.lianxidianhua = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
		})
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								emit('formModelChange')
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						emit('formModelChange')
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 0px solid #ddd;
		border-radius: 4px;
		padding: 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 150px 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: 150px;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #7da06630;
					border-radius: 0 0 20px 20px;
					padding: 0 10px;
					background: #7da06610;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 250px;
					height: 36px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
				// 富文本
				.list_editor {
					background-color: #7da06610;
					border-radius: 0 0 20px 20px;
					padding: 0;
					margin: 0;
					width: auto;
					min-height: 320px;
					border-color: #7da06630;
					border-width: 1px;
					border-style: solid;
					min-width: 100%;
					height: auto;
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		padding: 10px 0 20px 150px;
		display: flex;
		width: 100%;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 0 0 20px 20px;
			padding: 0 20px;
			margin: 0 20px 0 0;
			color: #fff;
			background: #b0a59a;
			width: auto;
			font-size: 16px;
			min-width: 100px;
			height: 50px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 0 0 20px 20px;
			padding: 0 20px;
			margin: 0 20px 0 0;
			color: #fff;
			background: #7ca065;
			width: auto;
			font-size: 16px;
			min-width: 100px;
			height: 50px;
		}
		.formModel_confirm:hover {
		}
	}
</style>