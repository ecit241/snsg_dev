.class Lcom/youzu/sanguohero/FloatWindowBigView$1;
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
    iput-object p1, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1;->this$0:Lcom/youzu/sanguohero/FloatWindowBigView;

    iput-object p2, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1;->val$context:Landroid/content/Context;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 57
    const-string v2, "http://tieba.baidu.com/f?ie=utf-8&kw=%E5%85%89%E7%8E%AF%E6%89%8B%E6%B8%B8"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 58
    .local v1, "uri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 59
    .local v0, "it":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 61
    iget-object v2, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1;->val$context:Landroid/content/Context;

    invoke-static {v2}, Lcom/youzu/sanguohero/MyWindowManager;->removeBigWindow(Landroid/content/Context;)V

    .line 62
    iget-object v2, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1;->val$context:Landroid/content/Context;

    invoke-static {v2}, Lcom/youzu/sanguohero/MyWindowManager;->createSmallWindow(Landroid/content/Context;)V

    .line 63
    iget-object v2, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1;->val$context:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 64
    return-void
.end method
