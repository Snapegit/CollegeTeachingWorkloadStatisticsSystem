<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="50%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="理论" prop="lilun">
							<el-input class="list_inp" v-model="form.lilun" placeholder="理论"
								 type="text" 								:readonly="!isAdd||disabledForm.lilun?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="实验" prop="shiyan">
							<el-input class="list_inp" v-model="form.shiyan" placeholder="实验"
								 type="text" 								:readonly="!isAdd||disabledForm.shiyan?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="实习" prop="shixi">
							<el-input class="list_inp" v-model="form.shixi" placeholder="实习"
								 type="text" 								:readonly="!isAdd||disabledForm.shixi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="课程系数" prop="kechengxishu">
							<el-input class="list_inp" v-model.number="form.kechengxishu" placeholder="课程系数"
								 type="number" 								:readonly="!isAdd||disabledForm.kechengxishu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="合班数量" prop="hebanshuliang">
							<el-input class="list_inp" v-model.number="form.hebanshuliang" placeholder="合班数量"
								 type="text" 								:readonly="!isAdd||disabledForm.hebanshuliang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="合班系数" prop="hebanxishu">
							<el-input class="list_inp" v-model.number="form.hebanxishu" placeholder="合班系数"
								 type="number" 								:readonly="!isAdd||disabledForm.hebanxishu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="指导毕业生人数" prop="zhidaobiyeshengrenshu">
							<el-input class="list_inp" v-model.number="form.zhidaobiyeshengrenshu" placeholder="指导毕业生人数"
								 type="number" 								:readonly="!isAdd||disabledForm.zhidaobiyeshengrenshu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="论文教学工作量" prop="lunwenjiaoxuegongzuoliang">
							<el-input class="list_inp" v-model.number="form.lunwenjiaoxuegongzuoliang" placeholder="论文教学工作量"
								 type="number" 								:readonly="!isAdd||disabledForm.lunwenjiaoxuegongzuoliang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="实验类型系数" prop="shiyanleixingxishu">
							<el-input class="list_inp" v-model.number="form.shiyanleixingxishu" placeholder="实验类型系数"
								 type="number" 								:readonly="!isAdd||disabledForm.shiyanleixingxishu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="实验调整系数" prop="shiyandiaozhengxishu">
							<el-input class="list_inp" v-model.number="form.shiyandiaozhengxishu" placeholder="实验调整系数"
								 type="number" 								:readonly="!isAdd||disabledForm.shiyandiaozhengxishu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="当量学时" prop="dangliangxueshi">
							<el-input class="list_inp" v-model.number="form.dangliangxueshi" placeholder="当量学时"
								 type="number" 								:readonly="!isAdd||disabledForm.dangliangxueshi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="备注" prop="beizhu">
							<el-input class="list_inp" v-model="form.beizhu" placeholder="备注"
								 type="text" 								:readonly="!isAdd||disabledForm.beizhu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="教师工号" prop="jiaoshigonghao">
							<el-input class="list_inp" v-model="form.jiaoshigonghao" placeholder="教师工号"
								 type="text" 								:readonly="!isAdd||disabledForm.jiaoshigonghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="教师姓名" prop="jiaoshixingming">
							<el-input class="list_inp" v-model="form.jiaoshixingming" placeholder="教师姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.jiaoshixingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="提交时间" prop="tijiaoshijian">
							<el-date-picker
								class="list_date"
								v-model="form.tijiaoshijian"
								format="YYYY 年 MM 月 DD 日"
								value-format="YYYY-MM-DD"
								type="datetime"
								:readonly="!isAdd||disabledForm.tijiaoshijian?true:false"
								placeholder="请选择提交时间" />
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
	const tableName = 'gongzuoliangxinxi'
	const formName = '工作量信息'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		lilun : false,
		shiyan : false,
		shixi : false,
		kechengxishu : false,
		hebanshuliang : false,
		hebanxishu : false,
		zhidaobiyeshengrenshu : false,
		lunwenjiaoxuegongzuoliang : false,
		shiyanleixingxishu : false,
		shiyandiaozhengxishu : false,
		dangliangxueshi : false,
		beizhu : false,
		jiaoshigonghao : false,
		jiaoshixingming : false,
		tijiaoshijian : false,
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
		lilun: [
		],
		shiyan: [
		],
		shixi: [
		],
		kechengxishu: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		hebanshuliang: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		hebanxishu: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		zhidaobiyeshengrenshu: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		lunwenjiaoxuegongzuoliang: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		shiyanleixingxishu: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		shiyandiaozhengxishu: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		dangliangxueshi: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		beizhu: [
		],
		jiaoshigonghao: [
		],
		jiaoshixingming: [
		],
		tijiaoshijian: [
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
			lilun: '',
			shiyan: '',
			shixi: '',
			kechengxishu: '',
			hebanshuliang: '',
			hebanxishu: '',
			zhidaobiyeshengrenshu: '',
			lunwenjiaoxuegongzuoliang: '',
			shiyanleixingxishu: '',
			shiyandiaozhengxishu: '',
			dangliangxueshi: '',
			beizhu: '',
			jiaoshigonghao: '',
			jiaoshixingming: '',
			tijiaoshijian: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
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
				if(x=='lilun'){
					form.value.lilun = row[x];
					disabledForm.value.lilun = true;
					continue;
				}
				if(x=='shiyan'){
					form.value.shiyan = row[x];
					disabledForm.value.shiyan = true;
					continue;
				}
				if(x=='shixi'){
					form.value.shixi = row[x];
					disabledForm.value.shixi = true;
					continue;
				}
				if(x=='kechengxishu'){
					form.value.kechengxishu = row[x];
					disabledForm.value.kechengxishu = true;
					continue;
				}
				if(x=='hebanshuliang'){
					form.value.hebanshuliang = row[x];
					disabledForm.value.hebanshuliang = true;
					continue;
				}
				if(x=='hebanxishu'){
					form.value.hebanxishu = row[x];
					disabledForm.value.hebanxishu = true;
					continue;
				}
				if(x=='zhidaobiyeshengrenshu'){
					form.value.zhidaobiyeshengrenshu = row[x];
					disabledForm.value.zhidaobiyeshengrenshu = true;
					continue;
				}
				if(x=='lunwenjiaoxuegongzuoliang'){
					form.value.lunwenjiaoxuegongzuoliang = row[x];
					disabledForm.value.lunwenjiaoxuegongzuoliang = true;
					continue;
				}
				if(x=='shiyanleixingxishu'){
					form.value.shiyanleixingxishu = row[x];
					disabledForm.value.shiyanleixingxishu = true;
					continue;
				}
				if(x=='shiyandiaozhengxishu'){
					form.value.shiyandiaozhengxishu = row[x];
					disabledForm.value.shiyandiaozhengxishu = true;
					continue;
				}
				if(x=='dangliangxueshi'){
					form.value.dangliangxueshi = row[x];
					disabledForm.value.dangliangxueshi = true;
					continue;
				}
				if(x=='beizhu'){
					form.value.beizhu = row[x];
					disabledForm.value.beizhu = true;
					continue;
				}
				if(x=='jiaoshigonghao'){
					form.value.jiaoshigonghao = row[x];
					disabledForm.value.jiaoshigonghao = true;
					continue;
				}
				if(x=='jiaoshixingming'){
					form.value.jiaoshixingming = row[x];
					disabledForm.value.jiaoshixingming = true;
					continue;
				}
				if(x=='tijiaoshijian'){
					form.value.tijiaoshijian = row[x];
					disabledForm.value.tijiaoshijian = true;
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
			if(json.hasOwnProperty('jiaoshigonghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.jiaoshigonghao = json.jiaoshigonghao
				disabledForm.value.jiaoshigonghao = true;
			}
			if(json.hasOwnProperty('jiaoshixingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.jiaoshixingming = json.jiaoshixingming
				disabledForm.value.jiaoshixingming = true;
			}
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
				//日期选择器
				.list_date {
					border: 1px solid #7da06630;
					border-radius: 0 0 20px 20px;
					background: #7da06610;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 250px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
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