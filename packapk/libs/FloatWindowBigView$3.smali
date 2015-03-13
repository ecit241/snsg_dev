.class Lcom/youzu/sanguohero/FloatWindowBigView$3;
.super Ljava/lang/Object;
.source "FloatWindowBigView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youzu/sanguohero/FloatWindowBigView;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youzu/sanguohero/FloatWindowBigView;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youzu/sanguohero/FloatWindowBigView$3;->this$0:Lcom/youzu/sanguohero/FloatWindowBigView;

    iput-object p2, p0, Lcom/youzu/sanguohero/FloatWindowBigView$3;->val$context:Landroid/content/Context;

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/youzu/sanguohero/FloatWindowBigView$3;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/youzu/sanguohero/MyWindowManager;->removeBigWindow(Landroid/content/Context;)V

    .line 84
    iget-object v0, p0, Lcom/youzu/sanguohero/FloatWindowBigView$3;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/youzu/sanguohero/MyWindowManager;->removeSmallWindow(Landroid/content/Context;)V

    .line 85
    return-void
.end method
