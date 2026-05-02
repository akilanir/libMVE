.class public Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;
.super Landroid/os/AsyncTask;
.source "LibsFragmentCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LibraryTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field ctx:Landroid/content/Context;

.field icon:Landroid/graphics/drawable/Drawable;

.field final synthetic this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

.field versionCode:Ljava/lang/Integer;

.field versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 137
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->icon:Landroid/graphics/drawable/Drawable;

    .line 140
    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    .line 141
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 132
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p1, "strings"    # [Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    const/4 v5, 0x0

    .line 155
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    if-nez v1, :cond_224

    .line 156
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/mikepenz/aboutlibraries/Libs;-><init>(Landroid/content/Context;)V

    .line 162
    .local v0, "libs":Lcom/mikepenz/aboutlibraries/Libs;
    :goto_13
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    const-string v10, "aboutLibraries_description_showIcon"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractBooleanBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$100(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    .line 163
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    const-string v10, "aboutLibraries_description_showVersion"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractBooleanBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$100(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    .line 164
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    const-string v10, "aboutLibraries_description_showVersionName"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractBooleanBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$100(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    .line 165
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    const-string v10, "aboutLibraries_description_showVersionCode"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractBooleanBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$100(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    .line 167
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    const-string v10, "aboutLibraries_description_name"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    .line 168
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    const-string v10, "aboutLibraries_description_text"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    .line 170
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    const-string v10, "aboutLibraries_description_special1_name"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    .line 171
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    const-string v10, "aboutLibraries_description_special1_text"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    .line 172
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    const-string v10, "aboutLibraries_description_special2_name"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    .line 173
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    const-string v10, "aboutLibraries_description_special2_text"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    .line 174
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    const-string v10, "aboutLibraries_description_special3_name"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    .line 175
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    const-string v10, "aboutLibraries_description_special3_text"

    # invokes: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v0, v4, v10}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    .line 178
    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->libraries:Ljava/util/ArrayList;
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$300()Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_1b7

    .line 180
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/mikepenz/aboutlibraries/Libs;->modifyLibraries(Ljava/util/HashMap;)V

    .line 183
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_17d

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    if-nez v1, :cond_17d

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->comparator:Ljava/util/Comparator;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$400(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Ljava/util/Comparator;

    move-result-object v1

    if-nez v1, :cond_17d

    const/4 v5, 0x1

    .line 185
    .local v5, "doDefaultSort":Z
    :cond_17d
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v2

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->internalLibraries:[Ljava/lang/String;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v3}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v3

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->excludeLibraries:[Ljava/lang/String;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->autoDetect:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual/range {v0 .. v5}, Lcom/mikepenz/aboutlibraries/Libs;->prepareLibraries(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;ZZ)Ljava/util/ArrayList;

    move-result-object v1

    # setter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->libraries:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 187
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->comparator:Ljava/util/Comparator;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$400(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Ljava/util/Comparator;

    move-result-object v1

    if-eqz v1, :cond_235

    .line 188
    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->libraries:Ljava/util/ArrayList;
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$300()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->comparator:Ljava/util/Comparator;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$400(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Ljava/util/Comparator;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 195
    .end local v5    # "doDefaultSort":Z
    :cond_1b7
    :goto_1b7
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    if-eqz v1, :cond_223

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    if-nez v1, :cond_1e3

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    if-nez v1, :cond_1e3

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_223

    .line 197
    :cond_1e3
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    .line 199
    .local v9, "pm":Landroid/content/pm/PackageManager;
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    .line 201
    .local v8, "packageName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 202
    .local v6, "appInfo":Landroid/content/pm/ApplicationInfo;
    const/4 v7, 0x0

    .line 204
    .local v7, "packageInfo":Landroid/content/pm/PackageInfo;
    const/4 v1, 0x0

    :try_start_1f2
    invoke-virtual {v9, v8, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    .line 205
    const/4 v1, 0x0

    invoke-virtual {v9, v8, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1fa
    .catch Ljava/lang/Exception; {:try_start_1f2 .. :try_end_1fa} :catch_250

    move-result-object v7

    .line 210
    :goto_1fb
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_211

    if-eqz v6, :cond_211

    .line 211
    invoke-virtual {v6, v9}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->icon:Landroid/graphics/drawable/Drawable;

    .line 215
    :cond_211
    iput-object v11, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->versionName:Ljava/lang/String;

    .line 216
    iput-object v11, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->versionCode:Ljava/lang/Integer;

    .line 217
    if-eqz v7, :cond_223

    .line 218
    iget-object v1, v7, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->versionName:Ljava/lang/String;

    .line 219
    iget v1, v7, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->versionCode:Ljava/lang/Integer;

    .line 222
    .end local v6    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v7    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v8    # "packageName":Ljava/lang/String;
    .end local v9    # "pm":Landroid/content/pm/PackageManager;
    :cond_223
    return-object v11

    .line 158
    .end local v0    # "libs":Lcom/mikepenz/aboutlibraries/Libs;
    :cond_224
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v2

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .restart local v0    # "libs":Lcom/mikepenz/aboutlibraries/Libs;
    goto/16 :goto_13

    .line 189
    .restart local v5    # "doDefaultSort":Z
    :cond_235
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v1

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    if-eqz v1, :cond_1b7

    .line 190
    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->libraries:Ljava/util/ArrayList;
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$300()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v2

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto/16 :goto_1b7

    .line 206
    .end local v5    # "doDefaultSort":Z
    .restart local v6    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v7    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v8    # "packageName":Ljava/lang/String;
    .restart local v9    # "pm":Landroid/content/pm/PackageManager;
    :catch_250
    move-exception v1

    goto :goto_1fb
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 132
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 228
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v2

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    if-eqz v2, :cond_56

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v2

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    if-nez v2, :cond_2c

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v2

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    if-nez v2, :cond_2c

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v2

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_56

    .line 230
    :cond_2c
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mAdapter:Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$500(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

    move-result-object v2

    new-instance v3, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    invoke-direct {v3}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;-><init>()V

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->withLibsBuilder(Lcom/mikepenz/aboutlibraries/LibsBuilder;)Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->versionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->withAboutVersionName(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->versionCode:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->withAboutVersionCode(Ljava/lang/Integer;)Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->withAboutIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->add(Lcom/mikepenz/fastadapter/IItem;)V

    .line 234
    :cond_56
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .local v1, "libraryItems":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;>;"
    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->libraries:Ljava/util/ArrayList;
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$300()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_63
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_86

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 236
    .local v0, "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    new-instance v3, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    invoke-direct {v3}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;-><init>()V

    invoke-virtual {v3, v0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->withLibrary(Lcom/mikepenz/aboutlibraries/entity/Library;)Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;
    invoke-static {v4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->withLibsBuilder(Lcom/mikepenz/aboutlibraries/LibsBuilder;)Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_63

    .line 238
    .end local v0    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_86
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->this$0:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    # getter for: Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mAdapter:Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    invoke-static {v2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->access$500(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->add(Ljava/util/List;)V

    .line 240
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 243
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLibTaskCallback()Lcom/mikepenz/aboutlibraries/LibTaskCallback;

    move-result-object v2

    if-eqz v2, :cond_a7

    .line 244
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLibTaskCallback()Lcom/mikepenz/aboutlibraries/LibTaskCallback;

    move-result-object v2

    invoke-interface {v2}, Lcom/mikepenz/aboutlibraries/LibTaskCallback;->onLibTaskFinished()V

    .line 248
    :cond_a7
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->ctx:Landroid/content/Context;

    .line 249
    return-void
.end method

.method protected onPreExecute()V
    .registers 2

    .prologue
    .line 146
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLibTaskCallback()Lcom/mikepenz/aboutlibraries/LibTaskCallback;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 147
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLibTaskCallback()Lcom/mikepenz/aboutlibraries/LibTaskCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/mikepenz/aboutlibraries/LibTaskCallback;->onLibTaskStarted()V

    .line 149
    :cond_15
    return-void
.end method
