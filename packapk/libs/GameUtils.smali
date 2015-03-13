.class public Lcom/youzu/sanguohero/GameUtils;
.super Ljava/lang/Object;
.source "GameUtils.java"


# static fields
.field public static Context:Landroid/content/Context;

.field private static InjectTag:Ljava/lang/String;

.field private static _instance:Lcom/youzu/sanguohero/GameUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-string v0, "INJECT"

    sput-object v0, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    .line 19
    const/4 v0, 0x0

    sput-object v0, Lcom/youzu/sanguohero/GameUtils;->_instance:Lcom/youzu/sanguohero/GameUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static getBRAND()Ljava/lang/String;
    .locals 2

    .prologue
    .line 108
    new-instance v0, Landroid/os/Build;

    invoke-direct {v0}, Landroid/os/Build;-><init>()V

    .line 110
    .local v0, "bd":Landroid/os/Build;
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 111
    .local v1, "model":Ljava/lang/String;
    return-object v1
.end method

.method public static getInstance()Lcom/youzu/sanguohero/GameUtils;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/youzu/sanguohero/GameUtils;->_instance:Lcom/youzu/sanguohero/GameUtils;

    if-nez v0, :cond_0

    .line 22
    new-instance v0, Lcom/youzu/sanguohero/GameUtils;

    invoke-direct {v0}, Lcom/youzu/sanguohero/GameUtils;-><init>()V

    sput-object v0, Lcom/youzu/sanguohero/GameUtils;->_instance:Lcom/youzu/sanguohero/GameUtils;

    .line 24
    :cond_0
    sget-object v0, Lcom/youzu/sanguohero/GameUtils;->_instance:Lcom/youzu/sanguohero/GameUtils;

    return-object v0
.end method

.method public static getPackName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    invoke-static {}, Lcom/youzu/sanguohero/MyApplication;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSkipStatus()I
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 28
    new-instance v5, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/youzu/sanguohero/GameUtils;->Context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/skip_status"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 31
    .local v4, "path":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 32
    .local v2, "fr":Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 33
    .local v0, "br":Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 34
    .local v3, "line":Ljava/lang/String;
    sget-object v5, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    const-string v6, "getSkipStatus:%s ret:%s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v8, 0x1

    aput-object v3, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 36
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V

    .line 37
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result v5

    .line 49
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "fr":Ljava/io/FileReader;
    .end local v3    # "line":Ljava/lang/String;
    :goto_0
    return v5

    .line 39
    :catch_0
    move-exception v1

    .line 40
    .local v1, "ex":Ljava/io/FileNotFoundException;
    sget-object v5, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    invoke-static {v9}, Lcom/youzu/sanguohero/GameUtils;->setSkipStatus(I)Z

    .line 49
    .end local v1    # "ex":Ljava/io/FileNotFoundException;
    :goto_1
    const/4 v5, -0x1

    goto :goto_0

    .line 43
    :catch_1
    move-exception v1

    .line 44
    .local v1, "ex":Ljava/io/IOException;
    sget-object v5, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 46
    .end local v1    # "ex":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 47
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v5, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static getSpeedStatus()I
    .locals 9

    .prologue
    .line 70
    new-instance v5, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/youzu/sanguohero/GameUtils;->Context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/speed_status"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 72
    .local v4, "path":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 73
    .local v2, "fr":Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 74
    .local v0, "br":Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 75
    .local v3, "line":Ljava/lang/String;
    sget-object v5, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    const-string v6, "getSpeedStatus:%s ret:%s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v8, 0x1

    aput-object v3, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 77
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V

    .line 78
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v5

    .line 86
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "fr":Ljava/io/FileReader;
    .end local v3    # "line":Ljava/lang/String;
    :goto_0
    return v5

    .line 80
    :catch_0
    move-exception v1

    .line 81
    .local v1, "ex":Ljava/io/FileNotFoundException;
    const-string v5, "INJECT"

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .end local v1    # "ex":Ljava/io/FileNotFoundException;
    :goto_1
    const/4 v5, -0x1

    goto :goto_0

    .line 83
    :catch_1
    move-exception v1

    .line 84
    .local v1, "ex":Ljava/lang/Exception;
    const-string v5, "INJECT"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static setSkipStatus(I)Z
    .locals 10
    .param p0, "n"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 52
    new-instance v5, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/youzu/sanguohero/GameUtils;->Context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/skip_status"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 54
    .local v2, "path":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    const/4 v5, 0x0

    invoke-direct {v1, v2, v5}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    .line 55
    .local v1, "fw":Ljava/io/FileWriter;
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 56
    sget-object v5, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    const-string v6, "setSkipStatus:%s ret:%d"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    const/4 v8, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 66
    .end local v1    # "fw":Ljava/io/FileWriter;
    :goto_0
    return v3

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "ex":Ljava/io/FileNotFoundException;
    sget-object v3, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v0    # "ex":Ljava/io/FileNotFoundException;
    :goto_1
    move v3, v4

    .line 66
    goto :goto_0

    .line 63
    :catch_1
    move-exception v0

    .line 64
    .local v0, "ex":Ljava/io/IOException;
    sget-object v3, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static setSpeedStatus(I)Z
    .locals 10
    .param p0, "n"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 89
    new-instance v5, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/youzu/sanguohero/GameUtils;->Context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/speed_status"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 91
    .local v2, "path":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    const/4 v5, 0x0

    invoke-direct {v1, v2, v5}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    .line 92
    .local v1, "fw":Ljava/io/FileWriter;
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 93
    sget-object v5, Lcom/youzu/sanguohero/GameUtils;->InjectTag:Ljava/lang/String;

    const-string v6, "setSpeedStatus:%s ret:%d"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    const/4 v8, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 103
    .end local v1    # "fw":Ljava/io/FileWriter;
    :goto_0
    return v3

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "ex":Ljava/io/FileNotFoundException;
    const-string v3, "INJECT"

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v0    # "ex":Ljava/io/FileNotFoundException;
    :goto_1
    move v3, v4

    .line 103
    goto :goto_0

    .line 100
    :catch_1
    move-exception v0

    .line 101
    .local v0, "ex":Ljava/io/IOException;
    const-string v3, "INJECT"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method public native doUpdate(ILjava/lang/String;)V
.end method
