.class Lkorex/mail/internet/ParameterList$MultiValue;
.super Ljava/util/ArrayList;
.source "ParameterList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/internet/ParameterList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MultiValue"
.end annotation


# instance fields
.field value:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 179
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lkorex/mail/internet/ParameterList$1;)V
    .registers 2
    .param p1, "x0"    # Lkorex/mail/internet/ParameterList$1;

    .prologue
    .line 179
    invoke-direct {p0}, Lkorex/mail/internet/ParameterList$MultiValue;-><init>()V

    return-void
.end method
