.class public Lcom/youzu/sanguohero/FloatWindowSmallView;
.super Landroid/widget/LinearLayout;
.source "FloatWindowSmallView.java"


# static fields
.field private static statusBarHeight:I

.field public static viewHeight:I

.field public static viewWidth:I


# instance fields
.field private mParams:Landroid/view/WindowManager$LayoutParams;

.field private windowManager:Landroid/view/WindowManager;

.field private xDownInScreen:F

.field private xInScreen:F

.field private xInView:F

.field private yDownInScreen:F

.field private yInScreen:F

.field private yInView:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 78
    const-string v6, "window"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/WindowManager;

    iput-object v6, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->windowManager:Landroid/view/WindowManager;

    .line 80
    const/4 v2, 0x0

    .line 82
    .local v2, "imageView":Landroid/widget/ImageView;
    :try_start_0
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .end local v2    # "imageView":Landroid/widget/ImageView;
    .local v3, "imageView":Landroid/widget/ImageView;
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "icon-128.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 85
    .local v4, "inputStream":Ljava/io/InputStream;
    const-string v6, "tackpic"

    invoke-static {v4, v6}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 86
    .local v0, "dr":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 87
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x48

    const/16 v7, 0x48

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 88
    .local v5, "mParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v3

    .line 95
    .end local v0    # "dr":Landroid/graphics/drawable/Drawable;
    .end local v3    # "imageView":Landroid/widget/ImageView;
    .end local v4    # "inputStream":Ljava/io/InputStream;
    .end local v5    # "mParams":Landroid/widget/LinearLayout$LayoutParams;
    .restart local v2    # "imageView":Landroid/widget/ImageView;
    :goto_0
    if-eqz v2, :cond_0

    .line 96
    invoke-virtual {p0, v2}, Lcom/youzu/sanguohero/FloatWindowSmallView;->addView(Landroid/view/View;)V

    .line 101
    :cond_0
    return-void

    .line 91
    :catch_0
    move-exception v1

    .line 92
    .local v1, "e":Ljava/io/IOException;
    :goto_1
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 91
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "imageView":Landroid/widget/ImageView;
    .restart local v3    # "imageView":Landroid/widget/ImageView;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "imageView":Landroid/widget/ImageView;
    .restart local v2    # "imageView":Landroid/widget/ImageView;
    goto :goto_1
.end method

.method private getStatusBarHeight()I
    .locals 6

    .prologue
    .line 167
    sget v5, Lcom/youzu/sanguohero/FloatWindowSmallView;->statusBarHeight:I

    if-nez v5, :cond_0

    .line 169
    :try_start_0
    const-string v5, "com.android.internal.R$dimen"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 170
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 171
    .local v3, "o":Ljava/lang/Object;
    const-string v5, "status_bar_height"

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 172
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 173
    .local v4, "x":I
    invoke-virtual {p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    sput v5, Lcom/youzu/sanguohero/FloatWindowSmallView;->statusBarHeight:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "x":I
    :cond_0
    :goto_0
    sget v5, Lcom/youzu/sanguohero/FloatWindowSmallView;->statusBarHeight:I

    return v5

    .line 174
    :catch_0
    move-exception v1

    .line 175
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private openBigWindow()V
    .locals 1

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/youzu/sanguohero/MyWindowManager;->createBigWindow(Landroid/content/Context;)V

    .line 158
    invoke-virtual {p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/youzu/sanguohero/MyWindowManager;->removeSmallWindow(Landroid/content/Context;)V

    .line 159
    return-void
.end method

.method private updateViewPosition()V
    .locals 3

    .prologue
    .line 147
    iget-object v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->mParams:Landroid/view/WindowManager$LayoutParams;

    iget v1, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->xInScreen:F

    iget v2, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->xInView:F

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 148
    iget-object v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->mParams:Landroid/view/WindowManager$LayoutParams;

    iget v1, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->yInScreen:F

    iget v2, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->yInView:F

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 150
    iget-object v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->windowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->mParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, p0, v1}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 105
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 130
    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 108
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->xInView:F

    .line 109
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->yInView:F

    .line 110
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->xDownInScreen:F

    .line 111
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    invoke-direct {p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;->getStatusBarHeight()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->yDownInScreen:F

    .line 112
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->xInScreen:F

    .line 113
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    invoke-direct {p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;->getStatusBarHeight()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->yInScreen:F

    goto :goto_0

    .line 116
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->xInScreen:F

    .line 117
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    invoke-direct {p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;->getStatusBarHeight()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->yInScreen:F

    .line 119
    invoke-direct {p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;->updateViewPosition()V

    goto :goto_0

    .line 123
    :pswitch_2
    iget v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->xDownInScreen:F

    iget v1, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->xInScreen:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->yDownInScreen:F

    iget v1, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->yInScreen:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 124
    invoke-direct {p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;->openBigWindow()V

    goto :goto_0

    .line 105
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public setParams(Landroid/view/WindowManager$LayoutParams;)V
    .locals 0
    .param p1, "params"    # Landroid/view/WindowManager$LayoutParams;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/youzu/sanguohero/FloatWindowSmallView;->mParams:Landroid/view/WindowManager$LayoutParams;

    .line 141
    return-void
.end method
