.class public Lcom/meizu/statsos/UsageStatsManagerService;
.super Landroid/app/Service;
.source "UsageStatsManagerService.java"


# instance fields
.field private mServer:Lcom/meizu/statsos/IUsageStatsManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    iget-object v3, p0, Lcom/meizu/statsos/UsageStatsManagerService;->mServer:Lcom/meizu/statsos/IUsageStatsManager;

    if-nez v3, :cond_1

    const-string v3, "online"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .local v1, "online":Z
    const-string v3, "upload"

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .local v2, "upload":Z
    invoke-virtual {p0}, Lcom/meizu/statsos/UsageStatsManagerService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_0

    move-object v0, p0

    :cond_0
    invoke-static {v0, v1, v2}, Lcom/meizu/statsos/UsageStatsManagerServer;->getInstance(Landroid/content/Context;ZZ)Lcom/meizu/statsos/UsageStatsManagerServer;

    move-result-object v3

    iput-object v3, p0, Lcom/meizu/statsos/UsageStatsManagerService;->mServer:Lcom/meizu/statsos/IUsageStatsManager;

    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "online":Z
    .end local v2    # "upload":Z
    :cond_1
    iget-object v3, p0, Lcom/meizu/statsos/UsageStatsManagerService;->mServer:Lcom/meizu/statsos/IUsageStatsManager;

    invoke-interface {v3}, Lcom/meizu/statsos/IUsageStatsManager;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    return-object v3
.end method

.method public onCreate()V
    .locals 0

    .prologue
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method