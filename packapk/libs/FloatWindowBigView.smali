.class public Lcom/youzu/sanguohero/FloatWindowBigView;
.super Landroid/widget/LinearLayout;
.source "FloatWindowBigView.java"


# static fields
.field public static viewHeight:I

.field public static viewWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v9, 0x1

    .line 42
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 44
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 45
    .local v3, "localLinearLayout":Landroid/widget/LinearLayout;
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 46
    new-instance v4, Lcom/youzu/sanguohero/ShapeBg;

    invoke-direct {v4, p1}, Lcom/youzu/sanguohero/ShapeBg;-><init>(Landroid/content/Context;)V

    .line 47
    .local v4, "localShapeBg":Lcom/youzu/sanguohero/ShapeBg;
    const/high16 v7, -0x1000000

    invoke-virtual {v4, v7}, Lcom/youzu/sanguohero/ShapeBg;->setColor(I)V

    .line 48
    const/4 v7, 0x4

    new-array v7, v7, [F

    fill-array-data v7, :array_0

    invoke-virtual {v4, v7}, Lcom/youzu/sanguohero/ShapeBg;->setCornerRadii([F)V

    .line 49
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 51
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    const/16 v8, 0x99

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 53
    const-string v7, " \u5149\u73af\u63d2\u4ef6 \n"

    new-instance v8, Lcom/youzu/sanguohero/FloatWindowBigView$1;

    invoke-direct {v8, p0, p1}, Lcom/youzu/sanguohero/FloatWindowBigView$1;-><init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V

    invoke-direct {p0, p1, v7, v8}, Lcom/youzu/sanguohero/FloatWindowBigView;->CreateSubMenu(Landroid/content/Context;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 67
    .local v2, "info":Landroid/widget/TextView;
    const-string v7, " \u8fd4\u56de "

    .line 68
    new-instance v8, Lcom/youzu/sanguohero/FloatWindowBigView$2;

    invoke-direct {v8, p0, p1}, Lcom/youzu/sanguohero/FloatWindowBigView$2;-><init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V

    .line 67
    invoke-direct {p0, p1, v7, v8}, Lcom/youzu/sanguohero/FloatWindowBigView;->CreateSubMenu(Landroid/content/Context;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 78
    .local v0, "back":Landroid/widget/TextView;
    const-string v7, " \u9000\u51fa "

    .line 79
    new-instance v8, Lcom/youzu/sanguohero/FloatWindowBigView$3;

    invoke-direct {v8, p0, p1}, Lcom/youzu/sanguohero/FloatWindowBigView$3;-><init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V

    .line 78
    invoke-direct {p0, p1, v7, v8}, Lcom/youzu/sanguohero/FloatWindowBigView;->CreateSubMenu(Landroid/content/Context;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 125
    .local v1, "exit":Landroid/widget/TextView;
    invoke-static {}, Lcom/youzu/sanguohero/GameUtils;->getSkipStatus()I

    move-result v7

    if-ne v7, v9, :cond_0

    .line 126
    const-string v7, " \u5173\u95ed\u8df3\u8fc7 "

    new-instance v8, Lcom/youzu/sanguohero/FloatWindowBigView$1mySkipOnClickListener;

    invoke-direct {v8, p0, p1}, Lcom/youzu/sanguohero/FloatWindowBigView$1mySkipOnClickListener;-><init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V

    invoke-direct {p0, p1, v7, v8}, Lcom/youzu/sanguohero/FloatWindowBigView;->CreateSubMenu(Landroid/content/Context;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 132
    .local v5, "skip":Landroid/widget/TextView;
    :goto_0
    invoke-static {}, Lcom/youzu/sanguohero/GameUtils;->getSpeedStatus()I

    move-result v7

    if-ne v7, v9, :cond_1

    .line 133
    const-string v7, " \u5173\u95ed\u52a0\u901f "

    new-instance v8, Lcom/youzu/sanguohero/FloatWindowBigView$1mySpeedOnClickListener;

    invoke-direct {v8, p0, p1}, Lcom/youzu/sanguohero/FloatWindowBigView$1mySpeedOnClickListener;-><init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V

    invoke-direct {p0, p1, v7, v8}, Lcom/youzu/sanguohero/FloatWindowBigView;->CreateSubMenu(Landroid/content/Context;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 142
    .local v6, "speed":Landroid/widget/TextView;
    :goto_1
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 145
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 146
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 148
    invoke-virtual {p0, v3}, Lcom/youzu/sanguohero/FloatWindowBigView;->addView(Landroid/view/View;)V

    .line 149
    return-void

    .line 129
    .end local v5    # "skip":Landroid/widget/TextView;
    .end local v6    # "speed":Landroid/widget/TextView;
    :cond_0
    const-string v7, " \u5f00\u542f\u8df3\u8fc7 "

    new-instance v8, Lcom/youzu/sanguohero/FloatWindowBigView$1mySkipOnClickListener;

    invoke-direct {v8, p0, p1}, Lcom/youzu/sanguohero/FloatWindowBigView$1mySkipOnClickListener;-><init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V

    invoke-direct {p0, p1, v7, v8}, Lcom/youzu/sanguohero/FloatWindowBigView;->CreateSubMenu(Landroid/content/Context;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .restart local v5    # "skip":Landroid/widget/TextView;
    goto :goto_0

    .line 136
    :cond_1
    const-string v7, " \u5f00\u542f\u52a0\u901f "

    new-instance v8, Lcom/youzu/sanguohero/FloatWindowBigView$1mySpeedOnClickListener;

    invoke-direct {v8, p0, p1}, Lcom/youzu/sanguohero/FloatWindowBigView$1mySpeedOnClickListener;-><init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V

    invoke-direct {p0, p1, v7, v8}, Lcom/youzu/sanguohero/FloatWindowBigView;->CreateSubMenu(Landroid/content/Context;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .restart local v6    # "speed":Landroid/widget/TextView;
    goto :goto_1

    .line 48
    nop

    :array_0
    .array-data 4
        0x40800000
        0x40800000
        0x40800000
        0x40800000
    .end array-data
.end method

.method private CreateSubMenu(Landroid/content/Context;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "ol"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v2, 0x5

    .line 31
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 32
    .local v0, "v":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    const/high16 v1, 0x41a00000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 34
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 35
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 36
    if-eqz p3, :cond_0

    .line 37
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    :cond_0
    return-object v0
.end method
