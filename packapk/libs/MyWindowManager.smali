.class public Lcom/youzu/sanguohero/MyWindowManager;
.super Ljava/lang/Object;
.source "MyWindowManager.java"


# static fields
.field private static bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

.field private static bigWindowParams:Landroid/view/WindowManager$LayoutParams;

.field private static mActivityManager:Landroid/app/ActivityManager;

.field private static mWindowManager:Landroid/view/WindowManager;

.field private static smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

.field private static smallWindowParams:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createBigWindow(Landroid/content/Context;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x1

    const/4 v5, -0x2

    .line 105
    invoke-static {p0}, Lcom/youzu/sanguohero/MyWindowManager;->getWindowManager(Landroid/content/Context;)Landroid/view/WindowManager;

    move-result-object v2

    .line 106
    .local v2, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getWidth()I

    move-result v1

    .line 107
    .local v1, "screenWidth":I
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getHeight()I

    move-result v0

    .line 108
    .local v0, "screenHeight":I
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

    if-nez v3, :cond_1

    .line 109
    new-instance v3, Lcom/youzu/sanguohero/FloatWindowBigView;

    invoke-direct {v3, p0}, Lcom/youzu/sanguohero/FloatWindowBigView;-><init>(Landroid/content/Context;)V

    sput-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

    .line 110
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    if-nez v3, :cond_0

    .line 111
    new-instance v3, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v3}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    sput-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    .line 113
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v4, 0x7d2

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 114
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v6, v3, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 115
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v4, 0x28

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 117
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v5, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 118
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v5, v3, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 119
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v6, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 121
    :cond_0
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

    sget-object v4, Lcom/youzu/sanguohero/MyWindowManager;->bigWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v2, v3, v4}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    :cond_1
    return-void
.end method

.method public static createSmallWindow(Landroid/content/Context;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, -0x2

    .line 56
    sput-object p0, Lcom/youzu/sanguohero/GameUtils;->Context:Landroid/content/Context;

    .line 57
    invoke-static {p0}, Lcom/youzu/sanguohero/MyWindowManager;->getWindowManager(Landroid/content/Context;)Landroid/view/WindowManager;

    move-result-object v2

    .line 58
    .local v2, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getWidth()I

    move-result v1

    .line 59
    .local v1, "screenWidth":I
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getHeight()I

    move-result v0

    .line 60
    .local v0, "screenHeight":I
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

    if-nez v3, :cond_1

    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

    if-nez v3, :cond_1

    .line 61
    new-instance v3, Lcom/youzu/sanguohero/FloatWindowSmallView;

    invoke-direct {v3, p0}, Lcom/youzu/sanguohero/FloatWindowSmallView;-><init>(Landroid/content/Context;)V

    sput-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

    .line 62
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    if-nez v3, :cond_0

    .line 63
    new-instance v3, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v3}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    sput-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    .line 64
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v4, 0x7d2

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 65
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v4, 0x1

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 66
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v4, 0x28

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 68
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v5, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 69
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v5, v3, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 70
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v4, 0x33

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 71
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v4, 0x0

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 72
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v4, 0x15e

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 78
    :cond_0
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

    sget-object v4, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v3, v4}, Lcom/youzu/sanguohero/FloatWindowSmallView;->setParams(Landroid/view/WindowManager$LayoutParams;)V

    .line 80
    sget-object v3, Lcom/youzu/sanguohero/MyWindowManager;->smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

    sget-object v4, Lcom/youzu/sanguohero/MyWindowManager;->smallWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v2, v3, v4}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    :cond_1
    return-void
.end method

.method private static getActivityManager(Landroid/content/Context;)Landroid/app/ActivityManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 183
    sget-object v0, Lcom/youzu/sanguohero/MyWindowManager;->mActivityManager:Landroid/app/ActivityManager;

    if-nez v0, :cond_0

    .line 184
    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    sput-object v0, Lcom/youzu/sanguohero/MyWindowManager;->mActivityManager:Landroid/app/ActivityManager;

    .line 186
    :cond_0
    sget-object v0, Lcom/youzu/sanguohero/MyWindowManager;->mActivityManager:Landroid/app/ActivityManager;

    return-object v0
.end method

.method private static getAvailableMemory(Landroid/content/Context;)J
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 222
    new-instance v0, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v0}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 223
    .local v0, "mi":Landroid/app/ActivityManager$MemoryInfo;
    invoke-static {p0}, Lcom/youzu/sanguohero/MyWindowManager;->getActivityManager(Landroid/content/Context;)Landroid/app/ActivityManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 224
    iget-wide v1, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    return-wide v1
.end method

.method public static getUsedPercentValue(Landroid/content/Context;)Ljava/lang/String;
    .locals 15
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 197
    const-string v3, "/proc/meminfo"

    .line 199
    .local v3, "dir":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 200
    .local v5, "fr":Ljava/io/FileReader;
    new-instance v2, Ljava/io/BufferedReader;

    const/16 v11, 0x800

    invoke-direct {v2, v5, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 201
    .local v2, "br":Ljava/io/BufferedReader;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 202
    .local v6, "memoryLine":Ljava/lang/String;
    const-string v11, "MemTotal:"

    invoke-virtual {v6, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 203
    .local v8, "subMemoryLine":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 204
    const-string v11, "\\D+"

    const-string v12, ""

    invoke-virtual {v8, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    int-to-long v9, v11

    .line 205
    .local v9, "totalMemorySize":J
    invoke-static {p0}, Lcom/youzu/sanguohero/MyWindowManager;->getAvailableMemory(Landroid/content/Context;)J

    move-result-wide v11

    const-wide/16 v13, 0x400

    div-long v0, v11, v13

    .line 206
    .local v0, "availableSize":J
    sub-long v11, v9, v0

    long-to-float v11, v11

    long-to-float v12, v9

    div-float/2addr v11, v12

    const/high16 v12, 0x42c80000

    mul-float/2addr v11, v12

    float-to-int v7, v11

    .line 207
    .local v7, "percent":I
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "%"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    .line 211
    .end local v0    # "availableSize":J
    .end local v2    # "br":Ljava/io/BufferedReader;
    .end local v5    # "fr":Ljava/io/FileReader;
    .end local v6    # "memoryLine":Ljava/lang/String;
    .end local v7    # "percent":I
    .end local v8    # "subMemoryLine":Ljava/lang/String;
    .end local v9    # "totalMemorySize":J
    :goto_0
    return-object v11

    .line 208
    :catch_0
    move-exception v4

    .line 209
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 211
    const-string v11, "\u60ac\u6d6e\u7a97"

    goto :goto_0
.end method

.method private static getWindowManager(Landroid/content/Context;)Landroid/view/WindowManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 169
    sget-object v0, Lcom/youzu/sanguohero/MyWindowManager;->mWindowManager:Landroid/view/WindowManager;

    if-nez v0, :cond_0

    .line 170
    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    sput-object v0, Lcom/youzu/sanguohero/MyWindowManager;->mWindowManager:Landroid/view/WindowManager;

    .line 172
    :cond_0
    sget-object v0, Lcom/youzu/sanguohero/MyWindowManager;->mWindowManager:Landroid/view/WindowManager;

    return-object v0
.end method

.method public static isWindowShowing()Z
    .locals 1

    .prologue
    .line 158
    sget-object v0, Lcom/youzu/sanguohero/MyWindowManager;->smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

    if-nez v0, :cond_0

    sget-object v0, Lcom/youzu/sanguohero/MyWindowManager;->bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static removeBigWindow(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 132
    sget-object v1, Lcom/youzu/sanguohero/MyWindowManager;->bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

    if-eqz v1, :cond_0

    .line 133
    invoke-static {p0}, Lcom/youzu/sanguohero/MyWindowManager;->getWindowManager(Landroid/content/Context;)Landroid/view/WindowManager;

    move-result-object v0

    .line 134
    .local v0, "windowManager":Landroid/view/WindowManager;
    sget-object v1, Lcom/youzu/sanguohero/MyWindowManager;->bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 135
    const/4 v1, 0x0

    sput-object v1, Lcom/youzu/sanguohero/MyWindowManager;->bigWindow:Lcom/youzu/sanguohero/FloatWindowBigView;

    .line 137
    .end local v0    # "windowManager":Landroid/view/WindowManager;
    :cond_0
    return-void
.end method

.method public static removeSmallWindow(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    sget-object v1, Lcom/youzu/sanguohero/MyWindowManager;->smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

    if-eqz v1, :cond_0

    .line 92
    invoke-static {p0}, Lcom/youzu/sanguohero/MyWindowManager;->getWindowManager(Landroid/content/Context;)Landroid/view/WindowManager;

    move-result-object v0

    .line 93
    .local v0, "windowManager":Landroid/view/WindowManager;
    sget-object v1, Lcom/youzu/sanguohero/MyWindowManager;->smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 94
    const/4 v1, 0x0

    sput-object v1, Lcom/youzu/sanguohero/MyWindowManager;->smallWindow:Lcom/youzu/sanguohero/FloatWindowSmallView;

    .line 96
    .end local v0    # "windowManager":Landroid/view/WindowManager;
    :cond_0
    return-void
.end method

.method public static updateUsedPercent(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 150
    return-void
.end method
