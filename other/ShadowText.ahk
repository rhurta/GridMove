ShadowText(X := 0, Y := 0, W := 100, H := 100, shadowX := 3, shadowY := 3, shadowcolor := "Black", textcolor := "White", shText := "Hello World!!!")
{
    dropX := X - shadowX
    dropY := Y - shadowY
    Gui, add, text, BackGroundTrans c%shadowcolor% X%dropX% Y%dropY% W%W% h%H% +0x201 +Center ,%shText%
    Gui, add, text, BackGroundTrans c%textcolor% X%X% Y%Y% W%W% h%H% +0x201 +Center ,%shText%
    return
}
