export default () ->
  @transition(
    @fromRoute('bands.band.songs')
    @toRoute('bands.band.details')
    @use('toRight')
    @reverse('toLeft')
  )

  @transition(
    @hasClass('band-description')
    @toValue(false)
    @use('fade', duration: 500)
  )
