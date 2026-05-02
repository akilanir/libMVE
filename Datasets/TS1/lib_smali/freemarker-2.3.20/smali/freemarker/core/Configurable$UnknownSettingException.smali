.class public Lfreemarker/core/Configurable$UnknownSettingException;
.super Lfreemarker/core/_MiscTemplateException;
.source "Configurable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/Configurable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UnknownSettingException"
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 1134
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "Unknown setting: "

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v2, p1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v2, v0, v1

    invoke-direct {p0, p2, v0}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 1135
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/core/Configurable$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lfreemarker/core/Environment;
    .param p3, "x2"    # Lfreemarker/core/Configurable$1;

    .prologue
    .line 1132
    invoke-direct {p0, p1, p2}, Lfreemarker/core/Configurable$UnknownSettingException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    return-void
.end method
