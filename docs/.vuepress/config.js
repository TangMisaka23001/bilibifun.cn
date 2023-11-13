module.exports = {
  lang: 'zh-CN',
  title: '个人建站测试',
  description: '个人建站测试',
  head: [['link', { rel: 'icon', href: 'logo.jpg' }]],

  themeConfig: {
    logo: 'logo.jpg',

    //顶部导航栏
    navbar: [
      {text:'我的博客', link: 'https://misakatang.cn'},
      {text:'Uptime-Kuma', link: 'https://uptime.bilibifun.cn'},
      {text:'Traefik', link: 'https://traefik.bilibifun.cn/dashboard/'},
      {text:'YARR', link: 'https://yarr.bilibifun.cn'},
      {text:'Portainer', link: 'https://portainer.bilibifun.cn'},
      {text:'Dozzle', link: 'https://dozzle.bilibifun.cn'},
      {text:'Plausible', link: 'https://plausible.bilibifun.cn'},
      {text:'青龙面板', link: 'https://qinglong.bilibifun.cn'},
      {text:'Bitwarden', link: 'https://bitwarden.bilibifun.cn'},
      {text:'RSS Hub', link: 'https://rsshub.bilibifun.cn'},
      // {text:'V2rayA', link: 'https://v2raya.bilibifun.cn'},
    ],
  },
}
