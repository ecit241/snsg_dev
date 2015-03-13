.class public Lcom/youzu/sanguohero/TestWM;
.super Ljava/lang/Object;
.source "TestWM.java"


# static fields
.field public static alllist:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private static me:Lcom/youzu/sanguohero/TestWM;

.field private static preView:Landroid/widget/LinearLayout;


# instance fields
.field public localDisplayMetrics:Landroid/util/DisplayMetrics;

.field private mActivity:Landroid/app/Activity;

.field private mDp:F

.field private mRootView:Landroid/widget/RelativeLayout;

.field public mShow:Z

.field public wm:Landroid/view/WindowManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    sput-object v0, Lcom/youzu/sanguohero/TestWM;->me:Lcom/youzu/sanguohero/TestWM;

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/youzu/sanguohero/TestWM;->alllist:Ljava/util/ArrayList;

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "paramActivity"    # Landroid/app/Activity;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youzu/sanguohero/TestWM;->mShow:Z

    .line 40
    iput-object p1, p0, Lcom/youzu/sanguohero/TestWM;->mActivity:Landroid/app/Activity;

    .line 41
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/youzu/sanguohero/TestWM;->localDisplayMetrics:Landroid/util/DisplayMetrics;

    .line 42
    iget-object v0, p0, Lcom/youzu/sanguohero/TestWM;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iget-object v1, p0, Lcom/youzu/sanguohero/TestWM;->localDisplayMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 43
    iget-object v0, p0, Lcom/youzu/sanguohero/TestWM;->localDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/youzu/sanguohero/TestWM;->mDp:F

    .line 44
    return-void
.end method

.method public static hidden(Landroid/app/Activity;)V
    .locals 1
    .param p0, "paramActivity"    # Landroid/app/Activity;

    .prologue
    .line 56
    sget-object v0, Lcom/youzu/sanguohero/TestWM;->me:Lcom/youzu/sanguohero/TestWM;

    if-eqz v0, :cond_0

    .line 57
    sget-object v0, Lcom/youzu/sanguohero/TestWM;->me:Lcom/youzu/sanguohero/TestWM;

    iget-object v0, v0, Lcom/youzu/sanguohero/TestWM;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/youzu/sanguohero/MyWindowManager;->removeBigWindow(Landroid/content/Context;)V

    .line 58
    sget-object v0, Lcom/youzu/sanguohero/TestWM;->me:Lcom/youzu/sanguohero/TestWM;

    iget-object v0, v0, Lcom/youzu/sanguohero/TestWM;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/youzu/sanguohero/MyWindowManager;->removeSmallWindow(Landroid/content/Context;)V

    .line 60
    :cond_0
    return-void
.end method

.method public static init(Landroid/app/Activity;)V
    .locals 2
    .param p0, "paramActivity"    # Landroid/app/Activity;

    .prologue
    .line 48
    new-instance v0, Lcom/youzu/sanguohero/TestWM;

    invoke-direct {v0, p0}, Lcom/youzu/sanguohero/TestWM;-><init>(Landroid/app/Activity;)V

    sput-object v0, Lcom/youzu/sanguohero/TestWM;->me:Lcom/youzu/sanguohero/TestWM;

    .line 49
    sget-object v0, Lcom/youzu/sanguohero/TestWM;->me:Lcom/youzu/sanguohero/TestWM;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/youzu/sanguohero/TestWM;->mShow:Z

    .line 50
    sget-object v0, Lcom/youzu/sanguohero/TestWM;->me:Lcom/youzu/sanguohero/TestWM;

    invoke-direct {v0}, Lcom/youzu/sanguohero/TestWM;->initView()V

    .line 52
    return-void
.end method

.method private initView()V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 70
    sget-object v0, Lcom/youzu/sanguohero/TestWM;->alllist:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 71
    iget-object v0, p0, Lcom/youzu/sanguohero/TestWM;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/youzu/sanguohero/MyWindowManager;->createSmallWindow(Landroid/content/Context;)V

    .line 72
    return-void
.end method

.method private show()V
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/youzu/sanguohero/TestWM;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/youzu/sanguohero/MyWindowManager;->createSmallWindow(Landroid/content/Context;)V

    .line 79
    return-void
.end method
