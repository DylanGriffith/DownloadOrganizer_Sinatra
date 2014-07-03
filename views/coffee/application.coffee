window.onload = ->
  new DownloadOrganizer.TopPanelView
    el: $('#top-panel')
  DownloadOrganizer.router = new DownloadOrganizer.AppRouter()
  downloadManager = new DownloadOrganizer.DownloadManagerView
    el: '#files-main-view'
  downloadManager.render()
  _.templateSettings.interpolate = /\{\{(.+?)\}\}/g
