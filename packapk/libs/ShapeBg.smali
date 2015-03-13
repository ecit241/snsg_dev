.class public Lcom/youzu/sanguohero/ShapeBg;
.super Landroid/graphics/drawable/GradientDrawable;
.source "ShapeBg.java"


# instance fields
.field private mdp:F

.field private metrics:Landroid/util/DisplayMetrics;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "paramActivity"    # Landroid/app/Activity;

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 14
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/youzu/sanguohero/ShapeBg;->metrics:Landroid/util/DisplayMetrics;

    .line 18
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iget-object v1, p0, Lcom/youzu/sanguohero/ShapeBg;->metrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 19
    iget-object v0, p0, Lcom/youzu/sanguohero/ShapeBg;->metrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/youzu/sanguohero/ShapeBg;->mdp:F

    .line 20
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/youzu/sanguohero/ShapeBg;->setShape(I)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 14
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/youzu/sanguohero/ShapeBg;->metrics:Landroid/util/DisplayMetrics;

    .line 25
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iget-object v1, p0, Lcom/youzu/sanguohero/ShapeBg;->metrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 26
    iget-object v0, p0, Lcom/youzu/sanguohero/ShapeBg;->metrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/youzu/sanguohero/ShapeBg;->mdp:F

    .line 27
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/youzu/sanguohero/ShapeBg;->setShape(I)V

    .line 28
    return-void
.end method


# virtual methods
.method public setCornerRadii([F)V
    .locals 5
    .param p1, "paramArrayOfFloat"    # [F

    .prologue
    .line 31
    array-length v1, p1

    .line 32
    .local v1, "i":I
    const/4 v3, 0x4

    if-ge v1, v3, :cond_0

    .line 40
    :goto_0
    return-void

    .line 34
    :cond_0
    const/16 v3, 0x8

    new-array v0, v3, [F

    .line 35
    .local v0, "arrayOfFloat":[F
    const/4 v2, 0x0

    .line 37
    .local v2, "j":I
    :goto_1
    shl-int/lit8 v3, v1, 0x1

    if-lt v2, v3, :cond_1

    .line 39
    invoke-super {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    goto :goto_0

    .line 42
    :cond_1
    shr-int/lit8 v3, v2, 0x1

    aget v3, p1, v3

    iget v4, p0, Lcom/youzu/sanguohero/ShapeBg;->mdp:F

    mul-float/2addr v3, v4

    aput v3, v0, v2

    .line 35
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public setCornerRadius(F)V
    .locals 1
    .param p1, "paramFloat"    # F

    .prologue
    .line 48
    iget v0, p0, Lcom/youzu/sanguohero/ShapeBg;->mdp:F

    mul-float/2addr v0, p1

    invoke-super {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 49
    return-void
.end method

.method public setStroke(II)V
    .locals 2
    .param p1, "paramInt1"    # I
    .param p2, "paramInt2"    # I

    .prologue
    .line 53
    int-to-float v0, p1

    iget v1, p0, Lcom/youzu/sanguohero/ShapeBg;->mdp:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-super {p0, v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 54
    return-void
.end method
