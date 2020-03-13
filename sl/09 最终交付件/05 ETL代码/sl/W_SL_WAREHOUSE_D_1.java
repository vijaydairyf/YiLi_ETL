// ORM class for table 'W_SL_WAREHOUSE_D_1'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Thu Jul 11 11:02:59 CST 2019
// For connector: org.apache.sqoop.manager.OracleManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class W_SL_WAREHOUSE_D_1 extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("WH_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        WH_NAME = (String)value;
      }
    });
    setters.put("WH_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        WH_CODE = (String)value;
      }
    });
    setters.put("LOCATON", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LOCATON = (java.math.BigDecimal)value;
      }
    });
    setters.put("DATE_FROM", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATE_FROM = (java.sql.Timestamp)value;
      }
    });
    setters.put("DATE_TO", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATE_TO = (java.sql.Timestamp)value;
      }
    });
    setters.put("CREATION_DATE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CREATION_DATE = (java.sql.Timestamp)value;
      }
    });
    setters.put("PARENT_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PARENT_ID = (java.math.BigDecimal)value;
      }
    });
    setters.put("PARENT_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PARENT_NAME = (String)value;
      }
    });
    setters.put("ROW_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ROW_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("INTEGRATION_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        INTEGRATION_ID = (String)value;
      }
    });
    setters.put("W_INSERT_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        W_INSERT_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("W_UPDATE_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        W_UPDATE_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("START_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        START_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("END_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        END_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("VERSION", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        VERSION = (java.math.BigDecimal)value;
      }
    });
    setters.put("CREATED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CREATED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("CHANGED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CHANGED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("AUX1_CHANGED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AUX1_CHANGED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("STATUS", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        STATUS = (String)value;
      }
    });
    setters.put("LONGITUDE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LONGITUDE = (java.math.BigDecimal)value;
      }
    });
    setters.put("LATITUDE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LATITUDE = (java.math.BigDecimal)value;
      }
    });
    setters.put("ORGN_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ORGN_TYPE = (String)value;
      }
    });
    setters.put("ATTRIBUTE4", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ATTRIBUTE4 = (String)value;
      }
    });
    setters.put("REQUEST_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        REQUEST_TYPE = (String)value;
      }
    });
    setters.put("ATTRIBUTE3", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ATTRIBUTE3 = (String)value;
      }
    });
    setters.put("ATTRIBUTE2", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ATTRIBUTE2 = (String)value;
      }
    });
    setters.put("ORGN_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ORGN_NAME = (String)value;
      }
    });
  }
  public W_SL_WAREHOUSE_D_1() {
    init0();
  }
  private String WH_NAME;
  public String get_WH_NAME() {
    return WH_NAME;
  }
  public void set_WH_NAME(String WH_NAME) {
    this.WH_NAME = WH_NAME;
  }
  public W_SL_WAREHOUSE_D_1 with_WH_NAME(String WH_NAME) {
    this.WH_NAME = WH_NAME;
    return this;
  }
  private String WH_CODE;
  public String get_WH_CODE() {
    return WH_CODE;
  }
  public void set_WH_CODE(String WH_CODE) {
    this.WH_CODE = WH_CODE;
  }
  public W_SL_WAREHOUSE_D_1 with_WH_CODE(String WH_CODE) {
    this.WH_CODE = WH_CODE;
    return this;
  }
  private java.math.BigDecimal LOCATON;
  public java.math.BigDecimal get_LOCATON() {
    return LOCATON;
  }
  public void set_LOCATON(java.math.BigDecimal LOCATON) {
    this.LOCATON = LOCATON;
  }
  public W_SL_WAREHOUSE_D_1 with_LOCATON(java.math.BigDecimal LOCATON) {
    this.LOCATON = LOCATON;
    return this;
  }
  private java.sql.Timestamp DATE_FROM;
  public java.sql.Timestamp get_DATE_FROM() {
    return DATE_FROM;
  }
  public void set_DATE_FROM(java.sql.Timestamp DATE_FROM) {
    this.DATE_FROM = DATE_FROM;
  }
  public W_SL_WAREHOUSE_D_1 with_DATE_FROM(java.sql.Timestamp DATE_FROM) {
    this.DATE_FROM = DATE_FROM;
    return this;
  }
  private java.sql.Timestamp DATE_TO;
  public java.sql.Timestamp get_DATE_TO() {
    return DATE_TO;
  }
  public void set_DATE_TO(java.sql.Timestamp DATE_TO) {
    this.DATE_TO = DATE_TO;
  }
  public W_SL_WAREHOUSE_D_1 with_DATE_TO(java.sql.Timestamp DATE_TO) {
    this.DATE_TO = DATE_TO;
    return this;
  }
  private java.sql.Timestamp CREATION_DATE;
  public java.sql.Timestamp get_CREATION_DATE() {
    return CREATION_DATE;
  }
  public void set_CREATION_DATE(java.sql.Timestamp CREATION_DATE) {
    this.CREATION_DATE = CREATION_DATE;
  }
  public W_SL_WAREHOUSE_D_1 with_CREATION_DATE(java.sql.Timestamp CREATION_DATE) {
    this.CREATION_DATE = CREATION_DATE;
    return this;
  }
  private java.math.BigDecimal PARENT_ID;
  public java.math.BigDecimal get_PARENT_ID() {
    return PARENT_ID;
  }
  public void set_PARENT_ID(java.math.BigDecimal PARENT_ID) {
    this.PARENT_ID = PARENT_ID;
  }
  public W_SL_WAREHOUSE_D_1 with_PARENT_ID(java.math.BigDecimal PARENT_ID) {
    this.PARENT_ID = PARENT_ID;
    return this;
  }
  private String PARENT_NAME;
  public String get_PARENT_NAME() {
    return PARENT_NAME;
  }
  public void set_PARENT_NAME(String PARENT_NAME) {
    this.PARENT_NAME = PARENT_NAME;
  }
  public W_SL_WAREHOUSE_D_1 with_PARENT_NAME(String PARENT_NAME) {
    this.PARENT_NAME = PARENT_NAME;
    return this;
  }
  private java.math.BigDecimal ROW_WID;
  public java.math.BigDecimal get_ROW_WID() {
    return ROW_WID;
  }
  public void set_ROW_WID(java.math.BigDecimal ROW_WID) {
    this.ROW_WID = ROW_WID;
  }
  public W_SL_WAREHOUSE_D_1 with_ROW_WID(java.math.BigDecimal ROW_WID) {
    this.ROW_WID = ROW_WID;
    return this;
  }
  private String INTEGRATION_ID;
  public String get_INTEGRATION_ID() {
    return INTEGRATION_ID;
  }
  public void set_INTEGRATION_ID(String INTEGRATION_ID) {
    this.INTEGRATION_ID = INTEGRATION_ID;
  }
  public W_SL_WAREHOUSE_D_1 with_INTEGRATION_ID(String INTEGRATION_ID) {
    this.INTEGRATION_ID = INTEGRATION_ID;
    return this;
  }
  private java.sql.Timestamp W_INSERT_DT;
  public java.sql.Timestamp get_W_INSERT_DT() {
    return W_INSERT_DT;
  }
  public void set_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
    this.W_INSERT_DT = W_INSERT_DT;
  }
  public W_SL_WAREHOUSE_D_1 with_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
    this.W_INSERT_DT = W_INSERT_DT;
    return this;
  }
  private java.sql.Timestamp W_UPDATE_DT;
  public java.sql.Timestamp get_W_UPDATE_DT() {
    return W_UPDATE_DT;
  }
  public void set_W_UPDATE_DT(java.sql.Timestamp W_UPDATE_DT) {
    this.W_UPDATE_DT = W_UPDATE_DT;
  }
  public W_SL_WAREHOUSE_D_1 with_W_UPDATE_DT(java.sql.Timestamp W_UPDATE_DT) {
    this.W_UPDATE_DT = W_UPDATE_DT;
    return this;
  }
  private java.sql.Timestamp START_DT;
  public java.sql.Timestamp get_START_DT() {
    return START_DT;
  }
  public void set_START_DT(java.sql.Timestamp START_DT) {
    this.START_DT = START_DT;
  }
  public W_SL_WAREHOUSE_D_1 with_START_DT(java.sql.Timestamp START_DT) {
    this.START_DT = START_DT;
    return this;
  }
  private java.sql.Timestamp END_DT;
  public java.sql.Timestamp get_END_DT() {
    return END_DT;
  }
  public void set_END_DT(java.sql.Timestamp END_DT) {
    this.END_DT = END_DT;
  }
  public W_SL_WAREHOUSE_D_1 with_END_DT(java.sql.Timestamp END_DT) {
    this.END_DT = END_DT;
    return this;
  }
  private java.math.BigDecimal VERSION;
  public java.math.BigDecimal get_VERSION() {
    return VERSION;
  }
  public void set_VERSION(java.math.BigDecimal VERSION) {
    this.VERSION = VERSION;
  }
  public W_SL_WAREHOUSE_D_1 with_VERSION(java.math.BigDecimal VERSION) {
    this.VERSION = VERSION;
    return this;
  }
  private java.sql.Timestamp CREATED_ON_DT;
  public java.sql.Timestamp get_CREATED_ON_DT() {
    return CREATED_ON_DT;
  }
  public void set_CREATED_ON_DT(java.sql.Timestamp CREATED_ON_DT) {
    this.CREATED_ON_DT = CREATED_ON_DT;
  }
  public W_SL_WAREHOUSE_D_1 with_CREATED_ON_DT(java.sql.Timestamp CREATED_ON_DT) {
    this.CREATED_ON_DT = CREATED_ON_DT;
    return this;
  }
  private java.sql.Timestamp CHANGED_ON_DT;
  public java.sql.Timestamp get_CHANGED_ON_DT() {
    return CHANGED_ON_DT;
  }
  public void set_CHANGED_ON_DT(java.sql.Timestamp CHANGED_ON_DT) {
    this.CHANGED_ON_DT = CHANGED_ON_DT;
  }
  public W_SL_WAREHOUSE_D_1 with_CHANGED_ON_DT(java.sql.Timestamp CHANGED_ON_DT) {
    this.CHANGED_ON_DT = CHANGED_ON_DT;
    return this;
  }
  private java.sql.Timestamp AUX1_CHANGED_ON_DT;
  public java.sql.Timestamp get_AUX1_CHANGED_ON_DT() {
    return AUX1_CHANGED_ON_DT;
  }
  public void set_AUX1_CHANGED_ON_DT(java.sql.Timestamp AUX1_CHANGED_ON_DT) {
    this.AUX1_CHANGED_ON_DT = AUX1_CHANGED_ON_DT;
  }
  public W_SL_WAREHOUSE_D_1 with_AUX1_CHANGED_ON_DT(java.sql.Timestamp AUX1_CHANGED_ON_DT) {
    this.AUX1_CHANGED_ON_DT = AUX1_CHANGED_ON_DT;
    return this;
  }
  private String STATUS;
  public String get_STATUS() {
    return STATUS;
  }
  public void set_STATUS(String STATUS) {
    this.STATUS = STATUS;
  }
  public W_SL_WAREHOUSE_D_1 with_STATUS(String STATUS) {
    this.STATUS = STATUS;
    return this;
  }
  private java.math.BigDecimal LONGITUDE;
  public java.math.BigDecimal get_LONGITUDE() {
    return LONGITUDE;
  }
  public void set_LONGITUDE(java.math.BigDecimal LONGITUDE) {
    this.LONGITUDE = LONGITUDE;
  }
  public W_SL_WAREHOUSE_D_1 with_LONGITUDE(java.math.BigDecimal LONGITUDE) {
    this.LONGITUDE = LONGITUDE;
    return this;
  }
  private java.math.BigDecimal LATITUDE;
  public java.math.BigDecimal get_LATITUDE() {
    return LATITUDE;
  }
  public void set_LATITUDE(java.math.BigDecimal LATITUDE) {
    this.LATITUDE = LATITUDE;
  }
  public W_SL_WAREHOUSE_D_1 with_LATITUDE(java.math.BigDecimal LATITUDE) {
    this.LATITUDE = LATITUDE;
    return this;
  }
  private String ORGN_TYPE;
  public String get_ORGN_TYPE() {
    return ORGN_TYPE;
  }
  public void set_ORGN_TYPE(String ORGN_TYPE) {
    this.ORGN_TYPE = ORGN_TYPE;
  }
  public W_SL_WAREHOUSE_D_1 with_ORGN_TYPE(String ORGN_TYPE) {
    this.ORGN_TYPE = ORGN_TYPE;
    return this;
  }
  private String ATTRIBUTE4;
  public String get_ATTRIBUTE4() {
    return ATTRIBUTE4;
  }
  public void set_ATTRIBUTE4(String ATTRIBUTE4) {
    this.ATTRIBUTE4 = ATTRIBUTE4;
  }
  public W_SL_WAREHOUSE_D_1 with_ATTRIBUTE4(String ATTRIBUTE4) {
    this.ATTRIBUTE4 = ATTRIBUTE4;
    return this;
  }
  private String REQUEST_TYPE;
  public String get_REQUEST_TYPE() {
    return REQUEST_TYPE;
  }
  public void set_REQUEST_TYPE(String REQUEST_TYPE) {
    this.REQUEST_TYPE = REQUEST_TYPE;
  }
  public W_SL_WAREHOUSE_D_1 with_REQUEST_TYPE(String REQUEST_TYPE) {
    this.REQUEST_TYPE = REQUEST_TYPE;
    return this;
  }
  private String ATTRIBUTE3;
  public String get_ATTRIBUTE3() {
    return ATTRIBUTE3;
  }
  public void set_ATTRIBUTE3(String ATTRIBUTE3) {
    this.ATTRIBUTE3 = ATTRIBUTE3;
  }
  public W_SL_WAREHOUSE_D_1 with_ATTRIBUTE3(String ATTRIBUTE3) {
    this.ATTRIBUTE3 = ATTRIBUTE3;
    return this;
  }
  private String ATTRIBUTE2;
  public String get_ATTRIBUTE2() {
    return ATTRIBUTE2;
  }
  public void set_ATTRIBUTE2(String ATTRIBUTE2) {
    this.ATTRIBUTE2 = ATTRIBUTE2;
  }
  public W_SL_WAREHOUSE_D_1 with_ATTRIBUTE2(String ATTRIBUTE2) {
    this.ATTRIBUTE2 = ATTRIBUTE2;
    return this;
  }
  private String ORGN_NAME;
  public String get_ORGN_NAME() {
    return ORGN_NAME;
  }
  public void set_ORGN_NAME(String ORGN_NAME) {
    this.ORGN_NAME = ORGN_NAME;
  }
  public W_SL_WAREHOUSE_D_1 with_ORGN_NAME(String ORGN_NAME) {
    this.ORGN_NAME = ORGN_NAME;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_SL_WAREHOUSE_D_1)) {
      return false;
    }
    W_SL_WAREHOUSE_D_1 that = (W_SL_WAREHOUSE_D_1) o;
    boolean equal = true;
    equal = equal && (this.WH_NAME == null ? that.WH_NAME == null : this.WH_NAME.equals(that.WH_NAME));
    equal = equal && (this.WH_CODE == null ? that.WH_CODE == null : this.WH_CODE.equals(that.WH_CODE));
    equal = equal && (this.LOCATON == null ? that.LOCATON == null : this.LOCATON.equals(that.LOCATON));
    equal = equal && (this.DATE_FROM == null ? that.DATE_FROM == null : this.DATE_FROM.equals(that.DATE_FROM));
    equal = equal && (this.DATE_TO == null ? that.DATE_TO == null : this.DATE_TO.equals(that.DATE_TO));
    equal = equal && (this.CREATION_DATE == null ? that.CREATION_DATE == null : this.CREATION_DATE.equals(that.CREATION_DATE));
    equal = equal && (this.PARENT_ID == null ? that.PARENT_ID == null : this.PARENT_ID.equals(that.PARENT_ID));
    equal = equal && (this.PARENT_NAME == null ? that.PARENT_NAME == null : this.PARENT_NAME.equals(that.PARENT_NAME));
    equal = equal && (this.ROW_WID == null ? that.ROW_WID == null : this.ROW_WID.equals(that.ROW_WID));
    equal = equal && (this.INTEGRATION_ID == null ? that.INTEGRATION_ID == null : this.INTEGRATION_ID.equals(that.INTEGRATION_ID));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.W_UPDATE_DT == null ? that.W_UPDATE_DT == null : this.W_UPDATE_DT.equals(that.W_UPDATE_DT));
    equal = equal && (this.START_DT == null ? that.START_DT == null : this.START_DT.equals(that.START_DT));
    equal = equal && (this.END_DT == null ? that.END_DT == null : this.END_DT.equals(that.END_DT));
    equal = equal && (this.VERSION == null ? that.VERSION == null : this.VERSION.equals(that.VERSION));
    equal = equal && (this.CREATED_ON_DT == null ? that.CREATED_ON_DT == null : this.CREATED_ON_DT.equals(that.CREATED_ON_DT));
    equal = equal && (this.CHANGED_ON_DT == null ? that.CHANGED_ON_DT == null : this.CHANGED_ON_DT.equals(that.CHANGED_ON_DT));
    equal = equal && (this.AUX1_CHANGED_ON_DT == null ? that.AUX1_CHANGED_ON_DT == null : this.AUX1_CHANGED_ON_DT.equals(that.AUX1_CHANGED_ON_DT));
    equal = equal && (this.STATUS == null ? that.STATUS == null : this.STATUS.equals(that.STATUS));
    equal = equal && (this.LONGITUDE == null ? that.LONGITUDE == null : this.LONGITUDE.equals(that.LONGITUDE));
    equal = equal && (this.LATITUDE == null ? that.LATITUDE == null : this.LATITUDE.equals(that.LATITUDE));
    equal = equal && (this.ORGN_TYPE == null ? that.ORGN_TYPE == null : this.ORGN_TYPE.equals(that.ORGN_TYPE));
    equal = equal && (this.ATTRIBUTE4 == null ? that.ATTRIBUTE4 == null : this.ATTRIBUTE4.equals(that.ATTRIBUTE4));
    equal = equal && (this.REQUEST_TYPE == null ? that.REQUEST_TYPE == null : this.REQUEST_TYPE.equals(that.REQUEST_TYPE));
    equal = equal && (this.ATTRIBUTE3 == null ? that.ATTRIBUTE3 == null : this.ATTRIBUTE3.equals(that.ATTRIBUTE3));
    equal = equal && (this.ATTRIBUTE2 == null ? that.ATTRIBUTE2 == null : this.ATTRIBUTE2.equals(that.ATTRIBUTE2));
    equal = equal && (this.ORGN_NAME == null ? that.ORGN_NAME == null : this.ORGN_NAME.equals(that.ORGN_NAME));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_SL_WAREHOUSE_D_1)) {
      return false;
    }
    W_SL_WAREHOUSE_D_1 that = (W_SL_WAREHOUSE_D_1) o;
    boolean equal = true;
    equal = equal && (this.WH_NAME == null ? that.WH_NAME == null : this.WH_NAME.equals(that.WH_NAME));
    equal = equal && (this.WH_CODE == null ? that.WH_CODE == null : this.WH_CODE.equals(that.WH_CODE));
    equal = equal && (this.LOCATON == null ? that.LOCATON == null : this.LOCATON.equals(that.LOCATON));
    equal = equal && (this.DATE_FROM == null ? that.DATE_FROM == null : this.DATE_FROM.equals(that.DATE_FROM));
    equal = equal && (this.DATE_TO == null ? that.DATE_TO == null : this.DATE_TO.equals(that.DATE_TO));
    equal = equal && (this.CREATION_DATE == null ? that.CREATION_DATE == null : this.CREATION_DATE.equals(that.CREATION_DATE));
    equal = equal && (this.PARENT_ID == null ? that.PARENT_ID == null : this.PARENT_ID.equals(that.PARENT_ID));
    equal = equal && (this.PARENT_NAME == null ? that.PARENT_NAME == null : this.PARENT_NAME.equals(that.PARENT_NAME));
    equal = equal && (this.ROW_WID == null ? that.ROW_WID == null : this.ROW_WID.equals(that.ROW_WID));
    equal = equal && (this.INTEGRATION_ID == null ? that.INTEGRATION_ID == null : this.INTEGRATION_ID.equals(that.INTEGRATION_ID));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.W_UPDATE_DT == null ? that.W_UPDATE_DT == null : this.W_UPDATE_DT.equals(that.W_UPDATE_DT));
    equal = equal && (this.START_DT == null ? that.START_DT == null : this.START_DT.equals(that.START_DT));
    equal = equal && (this.END_DT == null ? that.END_DT == null : this.END_DT.equals(that.END_DT));
    equal = equal && (this.VERSION == null ? that.VERSION == null : this.VERSION.equals(that.VERSION));
    equal = equal && (this.CREATED_ON_DT == null ? that.CREATED_ON_DT == null : this.CREATED_ON_DT.equals(that.CREATED_ON_DT));
    equal = equal && (this.CHANGED_ON_DT == null ? that.CHANGED_ON_DT == null : this.CHANGED_ON_DT.equals(that.CHANGED_ON_DT));
    equal = equal && (this.AUX1_CHANGED_ON_DT == null ? that.AUX1_CHANGED_ON_DT == null : this.AUX1_CHANGED_ON_DT.equals(that.AUX1_CHANGED_ON_DT));
    equal = equal && (this.STATUS == null ? that.STATUS == null : this.STATUS.equals(that.STATUS));
    equal = equal && (this.LONGITUDE == null ? that.LONGITUDE == null : this.LONGITUDE.equals(that.LONGITUDE));
    equal = equal && (this.LATITUDE == null ? that.LATITUDE == null : this.LATITUDE.equals(that.LATITUDE));
    equal = equal && (this.ORGN_TYPE == null ? that.ORGN_TYPE == null : this.ORGN_TYPE.equals(that.ORGN_TYPE));
    equal = equal && (this.ATTRIBUTE4 == null ? that.ATTRIBUTE4 == null : this.ATTRIBUTE4.equals(that.ATTRIBUTE4));
    equal = equal && (this.REQUEST_TYPE == null ? that.REQUEST_TYPE == null : this.REQUEST_TYPE.equals(that.REQUEST_TYPE));
    equal = equal && (this.ATTRIBUTE3 == null ? that.ATTRIBUTE3 == null : this.ATTRIBUTE3.equals(that.ATTRIBUTE3));
    equal = equal && (this.ATTRIBUTE2 == null ? that.ATTRIBUTE2 == null : this.ATTRIBUTE2.equals(that.ATTRIBUTE2));
    equal = equal && (this.ORGN_NAME == null ? that.ORGN_NAME == null : this.ORGN_NAME.equals(that.ORGN_NAME));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.WH_NAME = JdbcWritableBridge.readString(1, __dbResults);
    this.WH_CODE = JdbcWritableBridge.readString(2, __dbResults);
    this.LOCATON = JdbcWritableBridge.readBigDecimal(3, __dbResults);
    this.DATE_FROM = JdbcWritableBridge.readTimestamp(4, __dbResults);
    this.DATE_TO = JdbcWritableBridge.readTimestamp(5, __dbResults);
    this.CREATION_DATE = JdbcWritableBridge.readTimestamp(6, __dbResults);
    this.PARENT_ID = JdbcWritableBridge.readBigDecimal(7, __dbResults);
    this.PARENT_NAME = JdbcWritableBridge.readString(8, __dbResults);
    this.ROW_WID = JdbcWritableBridge.readBigDecimal(9, __dbResults);
    this.INTEGRATION_ID = JdbcWritableBridge.readString(10, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(11, __dbResults);
    this.W_UPDATE_DT = JdbcWritableBridge.readTimestamp(12, __dbResults);
    this.START_DT = JdbcWritableBridge.readTimestamp(13, __dbResults);
    this.END_DT = JdbcWritableBridge.readTimestamp(14, __dbResults);
    this.VERSION = JdbcWritableBridge.readBigDecimal(15, __dbResults);
    this.CREATED_ON_DT = JdbcWritableBridge.readTimestamp(16, __dbResults);
    this.CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(17, __dbResults);
    this.AUX1_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(18, __dbResults);
    this.STATUS = JdbcWritableBridge.readString(19, __dbResults);
    this.LONGITUDE = JdbcWritableBridge.readBigDecimal(20, __dbResults);
    this.LATITUDE = JdbcWritableBridge.readBigDecimal(21, __dbResults);
    this.ORGN_TYPE = JdbcWritableBridge.readString(22, __dbResults);
    this.ATTRIBUTE4 = JdbcWritableBridge.readString(23, __dbResults);
    this.REQUEST_TYPE = JdbcWritableBridge.readString(24, __dbResults);
    this.ATTRIBUTE3 = JdbcWritableBridge.readString(25, __dbResults);
    this.ATTRIBUTE2 = JdbcWritableBridge.readString(26, __dbResults);
    this.ORGN_NAME = JdbcWritableBridge.readString(27, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.WH_NAME = JdbcWritableBridge.readString(1, __dbResults);
    this.WH_CODE = JdbcWritableBridge.readString(2, __dbResults);
    this.LOCATON = JdbcWritableBridge.readBigDecimal(3, __dbResults);
    this.DATE_FROM = JdbcWritableBridge.readTimestamp(4, __dbResults);
    this.DATE_TO = JdbcWritableBridge.readTimestamp(5, __dbResults);
    this.CREATION_DATE = JdbcWritableBridge.readTimestamp(6, __dbResults);
    this.PARENT_ID = JdbcWritableBridge.readBigDecimal(7, __dbResults);
    this.PARENT_NAME = JdbcWritableBridge.readString(8, __dbResults);
    this.ROW_WID = JdbcWritableBridge.readBigDecimal(9, __dbResults);
    this.INTEGRATION_ID = JdbcWritableBridge.readString(10, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(11, __dbResults);
    this.W_UPDATE_DT = JdbcWritableBridge.readTimestamp(12, __dbResults);
    this.START_DT = JdbcWritableBridge.readTimestamp(13, __dbResults);
    this.END_DT = JdbcWritableBridge.readTimestamp(14, __dbResults);
    this.VERSION = JdbcWritableBridge.readBigDecimal(15, __dbResults);
    this.CREATED_ON_DT = JdbcWritableBridge.readTimestamp(16, __dbResults);
    this.CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(17, __dbResults);
    this.AUX1_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(18, __dbResults);
    this.STATUS = JdbcWritableBridge.readString(19, __dbResults);
    this.LONGITUDE = JdbcWritableBridge.readBigDecimal(20, __dbResults);
    this.LATITUDE = JdbcWritableBridge.readBigDecimal(21, __dbResults);
    this.ORGN_TYPE = JdbcWritableBridge.readString(22, __dbResults);
    this.ATTRIBUTE4 = JdbcWritableBridge.readString(23, __dbResults);
    this.REQUEST_TYPE = JdbcWritableBridge.readString(24, __dbResults);
    this.ATTRIBUTE3 = JdbcWritableBridge.readString(25, __dbResults);
    this.ATTRIBUTE2 = JdbcWritableBridge.readString(26, __dbResults);
    this.ORGN_NAME = JdbcWritableBridge.readString(27, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(WH_NAME, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(WH_CODE, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LOCATON, 3 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_FROM, 4 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_TO, 5 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CREATION_DATE, 6 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(PARENT_ID, 7 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(PARENT_NAME, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(ROW_WID, 9 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(INTEGRATION_ID, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 11 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_UPDATE_DT, 12 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(START_DT, 13 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(END_DT, 14 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(VERSION, 15 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CREATED_ON_DT, 16 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CHANGED_ON_DT, 17 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX1_CHANGED_ON_DT, 18 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(STATUS, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LONGITUDE, 20 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LATITUDE, 21 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(ORGN_TYPE, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ATTRIBUTE4, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(REQUEST_TYPE, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ATTRIBUTE3, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ATTRIBUTE2, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ORGN_NAME, 27 + __off, 12, __dbStmt);
    return 27;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(WH_NAME, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(WH_CODE, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LOCATON, 3 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_FROM, 4 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_TO, 5 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CREATION_DATE, 6 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(PARENT_ID, 7 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(PARENT_NAME, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(ROW_WID, 9 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(INTEGRATION_ID, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 11 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_UPDATE_DT, 12 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(START_DT, 13 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(END_DT, 14 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(VERSION, 15 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CREATED_ON_DT, 16 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CHANGED_ON_DT, 17 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX1_CHANGED_ON_DT, 18 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(STATUS, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LONGITUDE, 20 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(LATITUDE, 21 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(ORGN_TYPE, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ATTRIBUTE4, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(REQUEST_TYPE, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ATTRIBUTE3, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ATTRIBUTE2, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ORGN_NAME, 27 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.WH_NAME = null;
    } else {
    this.WH_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.WH_CODE = null;
    } else {
    this.WH_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LOCATON = null;
    } else {
    this.LOCATON = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DATE_FROM = null;
    } else {
    this.DATE_FROM = new Timestamp(__dataIn.readLong());
    this.DATE_FROM.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.DATE_TO = null;
    } else {
    this.DATE_TO = new Timestamp(__dataIn.readLong());
    this.DATE_TO.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.CREATION_DATE = null;
    } else {
    this.CREATION_DATE = new Timestamp(__dataIn.readLong());
    this.CREATION_DATE.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.PARENT_ID = null;
    } else {
    this.PARENT_ID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.PARENT_NAME = null;
    } else {
    this.PARENT_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ROW_WID = null;
    } else {
    this.ROW_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.INTEGRATION_ID = null;
    } else {
    this.INTEGRATION_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.W_INSERT_DT = null;
    } else {
    this.W_INSERT_DT = new Timestamp(__dataIn.readLong());
    this.W_INSERT_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.W_UPDATE_DT = null;
    } else {
    this.W_UPDATE_DT = new Timestamp(__dataIn.readLong());
    this.W_UPDATE_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.START_DT = null;
    } else {
    this.START_DT = new Timestamp(__dataIn.readLong());
    this.START_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.END_DT = null;
    } else {
    this.END_DT = new Timestamp(__dataIn.readLong());
    this.END_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.VERSION = null;
    } else {
    this.VERSION = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CREATED_ON_DT = null;
    } else {
    this.CREATED_ON_DT = new Timestamp(__dataIn.readLong());
    this.CREATED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.CHANGED_ON_DT = null;
    } else {
    this.CHANGED_ON_DT = new Timestamp(__dataIn.readLong());
    this.CHANGED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.AUX1_CHANGED_ON_DT = null;
    } else {
    this.AUX1_CHANGED_ON_DT = new Timestamp(__dataIn.readLong());
    this.AUX1_CHANGED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.STATUS = null;
    } else {
    this.STATUS = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LONGITUDE = null;
    } else {
    this.LONGITUDE = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LATITUDE = null;
    } else {
    this.LATITUDE = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ORGN_TYPE = null;
    } else {
    this.ORGN_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ATTRIBUTE4 = null;
    } else {
    this.ATTRIBUTE4 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.REQUEST_TYPE = null;
    } else {
    this.REQUEST_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ATTRIBUTE3 = null;
    } else {
    this.ATTRIBUTE3 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ATTRIBUTE2 = null;
    } else {
    this.ATTRIBUTE2 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ORGN_NAME = null;
    } else {
    this.ORGN_NAME = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.WH_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, WH_NAME);
    }
    if (null == this.WH_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, WH_CODE);
    }
    if (null == this.LOCATON) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LOCATON, __dataOut);
    }
    if (null == this.DATE_FROM) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_FROM.getTime());
    __dataOut.writeInt(this.DATE_FROM.getNanos());
    }
    if (null == this.DATE_TO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_TO.getTime());
    __dataOut.writeInt(this.DATE_TO.getNanos());
    }
    if (null == this.CREATION_DATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CREATION_DATE.getTime());
    __dataOut.writeInt(this.CREATION_DATE.getNanos());
    }
    if (null == this.PARENT_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.PARENT_ID, __dataOut);
    }
    if (null == this.PARENT_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PARENT_NAME);
    }
    if (null == this.ROW_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ROW_WID, __dataOut);
    }
    if (null == this.INTEGRATION_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, INTEGRATION_ID);
    }
    if (null == this.W_INSERT_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_INSERT_DT.getTime());
    __dataOut.writeInt(this.W_INSERT_DT.getNanos());
    }
    if (null == this.W_UPDATE_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_UPDATE_DT.getTime());
    __dataOut.writeInt(this.W_UPDATE_DT.getNanos());
    }
    if (null == this.START_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.START_DT.getTime());
    __dataOut.writeInt(this.START_DT.getNanos());
    }
    if (null == this.END_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.END_DT.getTime());
    __dataOut.writeInt(this.END_DT.getNanos());
    }
    if (null == this.VERSION) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.VERSION, __dataOut);
    }
    if (null == this.CREATED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CREATED_ON_DT.getTime());
    __dataOut.writeInt(this.CREATED_ON_DT.getNanos());
    }
    if (null == this.CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX1_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX1_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX1_CHANGED_ON_DT.getNanos());
    }
    if (null == this.STATUS) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, STATUS);
    }
    if (null == this.LONGITUDE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LONGITUDE, __dataOut);
    }
    if (null == this.LATITUDE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LATITUDE, __dataOut);
    }
    if (null == this.ORGN_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORGN_TYPE);
    }
    if (null == this.ATTRIBUTE4) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ATTRIBUTE4);
    }
    if (null == this.REQUEST_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, REQUEST_TYPE);
    }
    if (null == this.ATTRIBUTE3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ATTRIBUTE3);
    }
    if (null == this.ATTRIBUTE2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ATTRIBUTE2);
    }
    if (null == this.ORGN_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORGN_NAME);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.WH_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, WH_NAME);
    }
    if (null == this.WH_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, WH_CODE);
    }
    if (null == this.LOCATON) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LOCATON, __dataOut);
    }
    if (null == this.DATE_FROM) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_FROM.getTime());
    __dataOut.writeInt(this.DATE_FROM.getNanos());
    }
    if (null == this.DATE_TO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_TO.getTime());
    __dataOut.writeInt(this.DATE_TO.getNanos());
    }
    if (null == this.CREATION_DATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CREATION_DATE.getTime());
    __dataOut.writeInt(this.CREATION_DATE.getNanos());
    }
    if (null == this.PARENT_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.PARENT_ID, __dataOut);
    }
    if (null == this.PARENT_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PARENT_NAME);
    }
    if (null == this.ROW_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ROW_WID, __dataOut);
    }
    if (null == this.INTEGRATION_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, INTEGRATION_ID);
    }
    if (null == this.W_INSERT_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_INSERT_DT.getTime());
    __dataOut.writeInt(this.W_INSERT_DT.getNanos());
    }
    if (null == this.W_UPDATE_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_UPDATE_DT.getTime());
    __dataOut.writeInt(this.W_UPDATE_DT.getNanos());
    }
    if (null == this.START_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.START_DT.getTime());
    __dataOut.writeInt(this.START_DT.getNanos());
    }
    if (null == this.END_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.END_DT.getTime());
    __dataOut.writeInt(this.END_DT.getNanos());
    }
    if (null == this.VERSION) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.VERSION, __dataOut);
    }
    if (null == this.CREATED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CREATED_ON_DT.getTime());
    __dataOut.writeInt(this.CREATED_ON_DT.getNanos());
    }
    if (null == this.CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX1_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX1_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX1_CHANGED_ON_DT.getNanos());
    }
    if (null == this.STATUS) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, STATUS);
    }
    if (null == this.LONGITUDE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LONGITUDE, __dataOut);
    }
    if (null == this.LATITUDE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.LATITUDE, __dataOut);
    }
    if (null == this.ORGN_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORGN_TYPE);
    }
    if (null == this.ATTRIBUTE4) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ATTRIBUTE4);
    }
    if (null == this.REQUEST_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, REQUEST_TYPE);
    }
    if (null == this.ATTRIBUTE3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ATTRIBUTE3);
    }
    if (null == this.ATTRIBUTE2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ATTRIBUTE2);
    }
    if (null == this.ORGN_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORGN_NAME);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(WH_NAME==null?"null":WH_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WH_CODE==null?"null":WH_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LOCATON==null?"null":LOCATON.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_FROM==null?"null":"" + DATE_FROM, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_TO==null?"null":"" + DATE_TO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CREATION_DATE==null?"null":"" + CREATION_DATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PARENT_ID==null?"null":PARENT_ID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PARENT_NAME==null?"null":PARENT_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_WID==null?"null":ROW_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INTEGRATION_ID==null?"null":INTEGRATION_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"null":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_UPDATE_DT==null?"null":"" + W_UPDATE_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(START_DT==null?"null":"" + START_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(END_DT==null?"null":"" + END_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VERSION==null?"null":VERSION.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CREATED_ON_DT==null?"null":"" + CREATED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CHANGED_ON_DT==null?"null":"" + CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX1_CHANGED_ON_DT==null?"null":"" + AUX1_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(STATUS==null?"null":STATUS, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LONGITUDE==null?"null":LONGITUDE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LATITUDE==null?"null":LATITUDE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORGN_TYPE==null?"null":ORGN_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ATTRIBUTE4==null?"null":ATTRIBUTE4, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(REQUEST_TYPE==null?"null":REQUEST_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ATTRIBUTE3==null?"null":ATTRIBUTE3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ATTRIBUTE2==null?"null":ATTRIBUTE2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORGN_NAME==null?"null":ORGN_NAME, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(WH_NAME==null?"null":WH_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WH_CODE==null?"null":WH_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LOCATON==null?"null":LOCATON.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_FROM==null?"null":"" + DATE_FROM, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_TO==null?"null":"" + DATE_TO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CREATION_DATE==null?"null":"" + CREATION_DATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PARENT_ID==null?"null":PARENT_ID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PARENT_NAME==null?"null":PARENT_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_WID==null?"null":ROW_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INTEGRATION_ID==null?"null":INTEGRATION_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"null":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_UPDATE_DT==null?"null":"" + W_UPDATE_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(START_DT==null?"null":"" + START_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(END_DT==null?"null":"" + END_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VERSION==null?"null":VERSION.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CREATED_ON_DT==null?"null":"" + CREATED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CHANGED_ON_DT==null?"null":"" + CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX1_CHANGED_ON_DT==null?"null":"" + AUX1_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(STATUS==null?"null":STATUS, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LONGITUDE==null?"null":LONGITUDE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LATITUDE==null?"null":LATITUDE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORGN_TYPE==null?"null":ORGN_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ATTRIBUTE4==null?"null":ATTRIBUTE4, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(REQUEST_TYPE==null?"null":REQUEST_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ATTRIBUTE3==null?"null":ATTRIBUTE3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ATTRIBUTE2==null?"null":ATTRIBUTE2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORGN_NAME==null?"null":ORGN_NAME, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.WH_NAME = null; } else {
      this.WH_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.WH_CODE = null; } else {
      this.WH_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LOCATON = null; } else {
      this.LOCATON = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_FROM = null; } else {
      this.DATE_FROM = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_TO = null; } else {
      this.DATE_TO = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CREATION_DATE = null; } else {
      this.CREATION_DATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.PARENT_ID = null; } else {
      this.PARENT_ID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PARENT_NAME = null; } else {
      this.PARENT_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ROW_WID = null; } else {
      this.ROW_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.INTEGRATION_ID = null; } else {
      this.INTEGRATION_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_UPDATE_DT = null; } else {
      this.W_UPDATE_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.START_DT = null; } else {
      this.START_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.END_DT = null; } else {
      this.END_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VERSION = null; } else {
      this.VERSION = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CREATED_ON_DT = null; } else {
      this.CREATED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CHANGED_ON_DT = null; } else {
      this.CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX1_CHANGED_ON_DT = null; } else {
      this.AUX1_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.STATUS = null; } else {
      this.STATUS = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LONGITUDE = null; } else {
      this.LONGITUDE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LATITUDE = null; } else {
      this.LATITUDE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ORGN_TYPE = null; } else {
      this.ORGN_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ATTRIBUTE4 = null; } else {
      this.ATTRIBUTE4 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.REQUEST_TYPE = null; } else {
      this.REQUEST_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ATTRIBUTE3 = null; } else {
      this.ATTRIBUTE3 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ATTRIBUTE2 = null; } else {
      this.ATTRIBUTE2 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ORGN_NAME = null; } else {
      this.ORGN_NAME = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.WH_NAME = null; } else {
      this.WH_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.WH_CODE = null; } else {
      this.WH_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LOCATON = null; } else {
      this.LOCATON = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_FROM = null; } else {
      this.DATE_FROM = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_TO = null; } else {
      this.DATE_TO = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CREATION_DATE = null; } else {
      this.CREATION_DATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.PARENT_ID = null; } else {
      this.PARENT_ID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PARENT_NAME = null; } else {
      this.PARENT_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ROW_WID = null; } else {
      this.ROW_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.INTEGRATION_ID = null; } else {
      this.INTEGRATION_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_UPDATE_DT = null; } else {
      this.W_UPDATE_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.START_DT = null; } else {
      this.START_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.END_DT = null; } else {
      this.END_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VERSION = null; } else {
      this.VERSION = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CREATED_ON_DT = null; } else {
      this.CREATED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CHANGED_ON_DT = null; } else {
      this.CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX1_CHANGED_ON_DT = null; } else {
      this.AUX1_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.STATUS = null; } else {
      this.STATUS = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LONGITUDE = null; } else {
      this.LONGITUDE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LATITUDE = null; } else {
      this.LATITUDE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ORGN_TYPE = null; } else {
      this.ORGN_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ATTRIBUTE4 = null; } else {
      this.ATTRIBUTE4 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.REQUEST_TYPE = null; } else {
      this.REQUEST_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ATTRIBUTE3 = null; } else {
      this.ATTRIBUTE3 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ATTRIBUTE2 = null; } else {
      this.ATTRIBUTE2 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ORGN_NAME = null; } else {
      this.ORGN_NAME = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    W_SL_WAREHOUSE_D_1 o = (W_SL_WAREHOUSE_D_1) super.clone();
    o.DATE_FROM = (o.DATE_FROM != null) ? (java.sql.Timestamp) o.DATE_FROM.clone() : null;
    o.DATE_TO = (o.DATE_TO != null) ? (java.sql.Timestamp) o.DATE_TO.clone() : null;
    o.CREATION_DATE = (o.CREATION_DATE != null) ? (java.sql.Timestamp) o.CREATION_DATE.clone() : null;
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    o.W_UPDATE_DT = (o.W_UPDATE_DT != null) ? (java.sql.Timestamp) o.W_UPDATE_DT.clone() : null;
    o.START_DT = (o.START_DT != null) ? (java.sql.Timestamp) o.START_DT.clone() : null;
    o.END_DT = (o.END_DT != null) ? (java.sql.Timestamp) o.END_DT.clone() : null;
    o.CREATED_ON_DT = (o.CREATED_ON_DT != null) ? (java.sql.Timestamp) o.CREATED_ON_DT.clone() : null;
    o.CHANGED_ON_DT = (o.CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.CHANGED_ON_DT.clone() : null;
    o.AUX1_CHANGED_ON_DT = (o.AUX1_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX1_CHANGED_ON_DT.clone() : null;
    return o;
  }

  public void clone0(W_SL_WAREHOUSE_D_1 o) throws CloneNotSupportedException {
    o.DATE_FROM = (o.DATE_FROM != null) ? (java.sql.Timestamp) o.DATE_FROM.clone() : null;
    o.DATE_TO = (o.DATE_TO != null) ? (java.sql.Timestamp) o.DATE_TO.clone() : null;
    o.CREATION_DATE = (o.CREATION_DATE != null) ? (java.sql.Timestamp) o.CREATION_DATE.clone() : null;
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    o.W_UPDATE_DT = (o.W_UPDATE_DT != null) ? (java.sql.Timestamp) o.W_UPDATE_DT.clone() : null;
    o.START_DT = (o.START_DT != null) ? (java.sql.Timestamp) o.START_DT.clone() : null;
    o.END_DT = (o.END_DT != null) ? (java.sql.Timestamp) o.END_DT.clone() : null;
    o.CREATED_ON_DT = (o.CREATED_ON_DT != null) ? (java.sql.Timestamp) o.CREATED_ON_DT.clone() : null;
    o.CHANGED_ON_DT = (o.CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.CHANGED_ON_DT.clone() : null;
    o.AUX1_CHANGED_ON_DT = (o.AUX1_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX1_CHANGED_ON_DT.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("WH_NAME", this.WH_NAME);
    __sqoop$field_map.put("WH_CODE", this.WH_CODE);
    __sqoop$field_map.put("LOCATON", this.LOCATON);
    __sqoop$field_map.put("DATE_FROM", this.DATE_FROM);
    __sqoop$field_map.put("DATE_TO", this.DATE_TO);
    __sqoop$field_map.put("CREATION_DATE", this.CREATION_DATE);
    __sqoop$field_map.put("PARENT_ID", this.PARENT_ID);
    __sqoop$field_map.put("PARENT_NAME", this.PARENT_NAME);
    __sqoop$field_map.put("ROW_WID", this.ROW_WID);
    __sqoop$field_map.put("INTEGRATION_ID", this.INTEGRATION_ID);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("W_UPDATE_DT", this.W_UPDATE_DT);
    __sqoop$field_map.put("START_DT", this.START_DT);
    __sqoop$field_map.put("END_DT", this.END_DT);
    __sqoop$field_map.put("VERSION", this.VERSION);
    __sqoop$field_map.put("CREATED_ON_DT", this.CREATED_ON_DT);
    __sqoop$field_map.put("CHANGED_ON_DT", this.CHANGED_ON_DT);
    __sqoop$field_map.put("AUX1_CHANGED_ON_DT", this.AUX1_CHANGED_ON_DT);
    __sqoop$field_map.put("STATUS", this.STATUS);
    __sqoop$field_map.put("LONGITUDE", this.LONGITUDE);
    __sqoop$field_map.put("LATITUDE", this.LATITUDE);
    __sqoop$field_map.put("ORGN_TYPE", this.ORGN_TYPE);
    __sqoop$field_map.put("ATTRIBUTE4", this.ATTRIBUTE4);
    __sqoop$field_map.put("REQUEST_TYPE", this.REQUEST_TYPE);
    __sqoop$field_map.put("ATTRIBUTE3", this.ATTRIBUTE3);
    __sqoop$field_map.put("ATTRIBUTE2", this.ATTRIBUTE2);
    __sqoop$field_map.put("ORGN_NAME", this.ORGN_NAME);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("WH_NAME", this.WH_NAME);
    __sqoop$field_map.put("WH_CODE", this.WH_CODE);
    __sqoop$field_map.put("LOCATON", this.LOCATON);
    __sqoop$field_map.put("DATE_FROM", this.DATE_FROM);
    __sqoop$field_map.put("DATE_TO", this.DATE_TO);
    __sqoop$field_map.put("CREATION_DATE", this.CREATION_DATE);
    __sqoop$field_map.put("PARENT_ID", this.PARENT_ID);
    __sqoop$field_map.put("PARENT_NAME", this.PARENT_NAME);
    __sqoop$field_map.put("ROW_WID", this.ROW_WID);
    __sqoop$field_map.put("INTEGRATION_ID", this.INTEGRATION_ID);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("W_UPDATE_DT", this.W_UPDATE_DT);
    __sqoop$field_map.put("START_DT", this.START_DT);
    __sqoop$field_map.put("END_DT", this.END_DT);
    __sqoop$field_map.put("VERSION", this.VERSION);
    __sqoop$field_map.put("CREATED_ON_DT", this.CREATED_ON_DT);
    __sqoop$field_map.put("CHANGED_ON_DT", this.CHANGED_ON_DT);
    __sqoop$field_map.put("AUX1_CHANGED_ON_DT", this.AUX1_CHANGED_ON_DT);
    __sqoop$field_map.put("STATUS", this.STATUS);
    __sqoop$field_map.put("LONGITUDE", this.LONGITUDE);
    __sqoop$field_map.put("LATITUDE", this.LATITUDE);
    __sqoop$field_map.put("ORGN_TYPE", this.ORGN_TYPE);
    __sqoop$field_map.put("ATTRIBUTE4", this.ATTRIBUTE4);
    __sqoop$field_map.put("REQUEST_TYPE", this.REQUEST_TYPE);
    __sqoop$field_map.put("ATTRIBUTE3", this.ATTRIBUTE3);
    __sqoop$field_map.put("ATTRIBUTE2", this.ATTRIBUTE2);
    __sqoop$field_map.put("ORGN_NAME", this.ORGN_NAME);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
