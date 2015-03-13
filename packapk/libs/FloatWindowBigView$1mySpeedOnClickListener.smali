.class Lcom/youzu/sanguohero/FloatWindowBigView$1mySpeedOnClickListener;
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
    name = "mySpeedOnClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youzu/sanguohero/FloatWindowBigView;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 107
    iput-object p1, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1mySpeedOnClickListener;->this$0:Lcom/youzu/sanguohero/FloatWindowBigView;

    iput-object p2, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1mySpeedOnClickListener;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 111
    invoke-static {}, Lcom/youzu/sanguohero/GameUtils;->getSpeedStatus()I

    move-result v1

    if-ne v1, v2, :cond_1

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/youzu/sanguohero/GameUtils;->setSpeedStatus(I)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 112
    check-cast v0, Landroid/widget/TextView;

    .line 113
    .local v0, "vt":Landroid/widget/TextView;
    const-string v1, " \u5f00\u542f\u52a0\u901f "

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .end local v0    # "vt":Landroid/widget/TextView;
    :cond_0
    :goto_0
    invoke-static {}, Lcom/youzu/sanguohero/GameUtils;->getInstance()Lcom/youzu/sanguohero/GameUtils;

    move-result-object v1

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1mySpeedOnClickListener;->val$context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/youzu/sanguohero/GameUtils;->doUpdate(ILjava/lang/String;)V

    .line 121
    return-void

    .line 115
    :cond_1
    invoke-static {}, Lcom/youzu/sanguohero/GameUtils;->getSpeedStatus()I

    move-result v1

    if-ge v1, v2, :cond_0

    invoke-static {v2}, Lcom/youzu/sanguohero/GameUtils;->setSpeedStatus(I)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 116
    check-cast v0, Landroid/widget/TextView;

    .line 117
    .restart local v0    # "vt":Landroid/widget/TextView;
    const-string v1, " \u5173\u95ed\u52a0\u901f "

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
