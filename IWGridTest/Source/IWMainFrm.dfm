object IWMainForm: TIWMainForm
  Left = 0
  Top = 0
  Width = 1024
  Height = 587
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignSize = (
    1024
    587)
  DesignLeft = 8
  DesignTop = 8
  object IWRegion1: TIWRegion
    Left = 32
    Top = 13
    Width = 953
    Height = 571
    RenderInvisibleControls = True
    Anchors = []
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    DesignSize = (
      953
      571)
    object IWGrid1: TIWGrid
      Left = 3
      Top = 3
      Width = 612
      Height = 520
      Anchors = [akLeft, akTop, akBottom]
      BorderColors.Color = clNone
      BorderColors.Light = clNone
      BorderColors.Dark = clNone
      BGColor = clNone
      BorderSize = 0
      BorderStyle = tfDefault
      Caption = 'IWGrid1'
      CellPadding = 0
      CellSpacing = 0
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FrameBuffer = 40
      Lines = tlAll
      UseFrame = False
      UseSize = False
      FriendlyName = 'IWGrid1'
      ColumnCount = 6
      RowCount = 10
      ShowEmptyCells = True
      ShowInvisibleRows = True
      ScrollToCurrentRow = False
    end
    object IWButton1: TIWButton
      Left = 3
      Top = 526
      Width = 75
      Height = 39
      Anchors = [akLeft, akBottom]
      Caption = 'Fill'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'IWButton1'
      TabOrder = 0
      OnClick = IWButton1Click
      ExplicitTop = 399
    end
    object IWMemo1: TIWMemo
      Left = 617
      Top = 3
      Width = 331
      Height = 521
      Anchors = []
      StyleRenderOptions.RenderBorder = False
      BGColor = clNone
      Editable = True
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      InvisibleBorder = False
      HorizScrollBar = False
      VertScrollBar = True
      Required = False
      TabOrder = 1
      SubmitOnAsyncEvent = True
      FriendlyName = 'IWMemo1'
      Lines.Strings = (
        ' 1. Click Fill'
        ' 2. Enter some values into cell in Columns 0'
        
          ' 3. Push Enter key - all cell in current row should have the val' +
          'ue, witch did enter.'
        ' '
        
          ' But is one problem, all controls from current row move to left,' +
          ' upper corner of IWGrid.')
    end
  end
end
