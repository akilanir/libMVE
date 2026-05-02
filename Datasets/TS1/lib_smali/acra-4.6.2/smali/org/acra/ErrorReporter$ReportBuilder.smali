.class public final Lorg/acra/ErrorReporter$ReportBuilder;
.super Ljava/lang/Object;
.source "ErrorReporter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/acra/ErrorReporter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ReportBuilder"
.end annotation


# instance fields
.field private mCustomData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mEndsApplication:Z

.field private mException:Ljava/lang/Throwable;

.field private mForceSilent:Z

.field private mMessage:Ljava/lang/String;

.field private mUncaughtExceptionThread:Ljava/lang/Thread;

.field final synthetic this$0:Lorg/acra/ErrorReporter;


# direct methods
.method public constructor <init>(Lorg/acra/ErrorReporter;)V
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 1038
    iput-object p1, p0, Lorg/acra/ErrorReporter$ReportBuilder;->this$0:Lorg/acra/ErrorReporter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1045
    iput-boolean v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mForceSilent:Z

    .line 1046
    iput-boolean v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mEndsApplication:Z

    return-void
.end method

.method static synthetic access$100(Lorg/acra/ErrorReporter$ReportBuilder;Ljava/lang/Thread;)Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 3
    .param p0, "x0"    # Lorg/acra/ErrorReporter$ReportBuilder;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 1038
    invoke-direct {p0, p1}, Lorg/acra/ErrorReporter$ReportBuilder;->uncaughtExceptionThread(Ljava/lang/Thread;)Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lorg/acra/ErrorReporter$ReportBuilder;)Z
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 1038
    iget-boolean v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mForceSilent:Z

    return v0
.end method

.method static synthetic access$500(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 1038
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mMessage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Throwable;
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 1038
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mException:Ljava/lang/Throwable;

    return-object v0
.end method

.method static synthetic access$700(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 1038
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mCustomData:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$800(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Thread;
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 1038
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mUncaughtExceptionThread:Ljava/lang/Thread;

    return-object v0
.end method

.method static synthetic access$900(Lorg/acra/ErrorReporter$ReportBuilder;)Z
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 1038
    iget-boolean v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mEndsApplication:Z

    return v0
.end method

.method private initCustomData()V
    .registers 2

    .prologue
    .line 1082
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mCustomData:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 1083
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mCustomData:Ljava/util/Map;

    .line 1084
    :cond_b
    return-void
.end method

.method private uncaughtExceptionThread(Ljava/lang/Thread;)Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 2
    .param p1, "thread"    # Ljava/lang/Thread;

    .prologue
    .line 1066
    iput-object p1, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mUncaughtExceptionThread:Ljava/lang/Thread;

    .line 1067
    return-object p0
.end method


# virtual methods
.method public customData(Ljava/lang/String;Ljava/lang/String;)Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 1110
    invoke-direct {p0}, Lorg/acra/ErrorReporter$ReportBuilder;->initCustomData()V

    .line 1111
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mCustomData:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1112
    return-object p0
.end method

.method public customData(Ljava/util/Map;)Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/acra/ErrorReporter$ReportBuilder;"
        }
    .end annotation

    .prologue
    .line 1095
    .local p1, "customData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lorg/acra/ErrorReporter$ReportBuilder;->initCustomData()V

    .line 1096
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mCustomData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1097
    return-object p0
.end method

.method public endsApplication()Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 2

    .prologue
    .line 1131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mEndsApplication:Z

    .line 1132
    return-object p0
.end method

.method public exception(Ljava/lang/Throwable;)Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 1077
    iput-object p1, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mException:Ljava/lang/Throwable;

    .line 1078
    return-object p0
.end method

.method public forceSilent()Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 2

    .prologue
    .line 1121
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mForceSilent:Z

    .line 1122
    return-object p0
.end method

.method public message(Ljava/lang/String;)Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1055
    iput-object p1, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mMessage:Ljava/lang/String;

    .line 1056
    return-object p0
.end method

.method public send()V
    .registers 2

    .prologue
    .line 1139
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mMessage:Ljava/lang/String;

    if-nez v0, :cond_c

    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mException:Ljava/lang/Throwable;

    if-nez v0, :cond_c

    .line 1140
    const-string v0, "Report requested by developer"

    iput-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->mMessage:Ljava/lang/String;

    .line 1142
    :cond_c
    iget-object v0, p0, Lorg/acra/ErrorReporter$ReportBuilder;->this$0:Lorg/acra/ErrorReporter;

    # invokes: Lorg/acra/ErrorReporter;->report(Lorg/acra/ErrorReporter$ReportBuilder;)V
    invoke-static {v0, p0}, Lorg/acra/ErrorReporter;->access$1400(Lorg/acra/ErrorReporter;Lorg/acra/ErrorReporter$ReportBuilder;)V

    .line 1143
    return-void
.end method
