.class public Lcom/youzu/sanguohero/MyApplication;
.super Landroid/app/Application;
.source "MyApplication.java"


# static fields
.field private static context:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getAppContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/youzu/sanguohero/MyApplication;->context:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .prologue
    .line 11
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 12
    invoke-virtual {p0}, Lcom/youzu/sanguohero/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/youzu/sanguohero/MyApplication;->context:Landroid/content/Context;

    .line 13
    return-void
.end method
