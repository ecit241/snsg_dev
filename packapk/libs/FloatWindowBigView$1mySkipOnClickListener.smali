.class Lcom/youzu/sanguohero/FloatWindowBigView$1mySkipOnClickListener;
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
    name = "mySkipOnClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youzu/sanguohero/FloatWindowBigView;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/youzu/sanguohero/FloatWindowBigView;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 90
    iput-object p1, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1mySkipOnClickListener;->this$0:Lcom/youzu/sanguohero/FloatWindowBigView;

    iput-object p2, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1mySkipOnClickListener;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    .line 94
    invoke-static {}, Lcom/youzu/sanguohero/GameUtils;->getSkipStatus()I

    move-result v1

    if-ne v1, v3, :cond_1

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/youzu/sanguohero/GameUtils;->setSkipStatus(I)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 95
    check-cast v0, Landroid/widget/TextView;

    .line 96
    .local v0, "vt":Landroid/widget/TextView;
    const-string v1, " \u5f00\u542f\u8df3\u8fc7 "

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .end local v0    # "vt":Landroid/widget/TextView;
    :cond_0
    :goto_0
    invoke-static {}, Lcom/youzu/sanguohero/GameUtils;->getInstance()Lcom/youzu/sanguohero/GameUtils;

    move-result-object v1

    iget-object v2, p0, Lcom/youzu/sanguohero/FloatWindowBigView$1mySkipOnClickListener;->val$context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/youzu/sanguohero/GameUtils;->doUpdate(ILjava/lang/String;)V

    .line 104
    return-void

    .line 98
    :cond_1
    invoke-static {}, Lcom/youzu/sanguohero/GameUtils;->getSkipStatus()I

    move-result v1

    if-ge v1, v3, :cond_0

    invoke-static {v3}, Lcom/youzu/sanguohero/GameUtils;->setSkipStatus(I)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 99
    check-cast v0, Landroid/widget/TextView;

    .line 100
    .restart local v0    # "vt":Landroid/widget/TextView;
    const-string v1, " \u5173\u95ed\u8df3\u8fc7 "

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
