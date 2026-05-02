.class public Lch/qos/logback/core/pattern/util/AlmostAsIsEscapeUtil;
.super Lch/qos/logback/core/pattern/util/RestrictedEscapeUtil;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/pattern/util/RestrictedEscapeUtil;-><init>()V

    return-void
.end method


# virtual methods
.method public escape(Ljava/lang/String;Ljava/lang/StringBuffer;CI)V
    .registers 6

    const-string v0, "%)"

    invoke-super {p0, v0, p2, p3, p4}, Lch/qos/logback/core/pattern/util/RestrictedEscapeUtil;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;CI)V

    return-void
.end method
