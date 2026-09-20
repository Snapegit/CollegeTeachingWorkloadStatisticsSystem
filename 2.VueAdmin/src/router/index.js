	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import gongzuoxinxi from '@/views/gongzuoxinxi/list'
	import gongzuoliangxinxi from '@/views/gongzuoliangxinxi/list'
	import suodaikecheng from '@/views/suodaikecheng/list'
	import jiaoshi from '@/views/jiaoshi/list'
	import jiaoshiRegister from '@/views/jiaoshi/register'
	import jiaoshiCenter from '@/views/jiaoshi/center'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/jiaoshiCenter',
			name: '教师个人中心',
			component: jiaoshiCenter
		}
		,{
			path: '/gongzuoxinxi',
			name: '工作信息',
			component: gongzuoxinxi
		}
		,{
			path: '/gongzuoliangxinxi',
			name: '工作量信息',
			component: gongzuoliangxinxi
		}
		,{
			path: '/suodaikecheng',
			name: '所带课程',
			component: suodaikecheng
		}
		,{
			path: '/jiaoshi',
			name: '教师',
			component: jiaoshi
		}
		]
	},
	{
		path: '/jiaoshiRegister',
		name: '教师注册',
		component: jiaoshiRegister
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
