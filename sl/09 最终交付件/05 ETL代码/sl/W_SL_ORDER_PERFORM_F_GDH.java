// ORM class for table 'W_SL_ORDER_PERFORM_F_GDH'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Fri Jul 26 15:33:25 CST 2019
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

public class W_SL_ORDER_PERFORM_F_GDH extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("DATASOURCE_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATASOURCE_ID = (String)value;
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
    setters.put("HEADER_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        HEADER_ID = (String)value;
      }
    });
    setters.put("ORDER_NUMBER", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ORDER_NUMBER = (String)value;
      }
    });
    setters.put("BOOKED_DATE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BOOKED_DATE = (java.sql.Timestamp)value;
      }
    });
    setters.put("BOOKED_DT_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BOOKED_DT_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("BG_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_NAME = (String)value;
      }
    });
    setters.put("AREA_FIVE_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AREA_FIVE_CODE = (String)value;
      }
    });
    setters.put("DEALER_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_NAME = (String)value;
      }
    });
    setters.put("DEALER_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_CODE = (String)value;
      }
    });
    setters.put("ORDER_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ORDER_TYPE = (String)value;
      }
    });
    setters.put("CPBH", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CPBH = (String)value;
      }
    });
    setters.put("DOWN_QTY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DOWN_QTY = (java.math.BigDecimal)value;
      }
    });
    setters.put("DOWN_WHT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DOWN_WHT = (java.math.BigDecimal)value;
      }
    });
    setters.put("DOWN_PROD", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DOWN_PROD = (java.math.BigDecimal)value;
      }
    });
    setters.put("UP_QTY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        UP_QTY = (java.math.BigDecimal)value;
      }
    });
    setters.put("UP_WHT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        UP_WHT = (java.math.BigDecimal)value;
      }
    });
    setters.put("UP_PROD", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        UP_PROD = (java.math.BigDecimal)value;
      }
    });
    setters.put("BG_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("DEALER_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("PRODUCT_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PRODUCT_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("ETL_RUN_TIME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ETL_RUN_TIME = (java.sql.Timestamp)value;
      }
    });
    setters.put("AREA_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AREA_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("REQUEST_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        REQUEST_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("WH_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        WH_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("REQUEST_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        REQUEST_TYPE = (String)value;
      }
    });
    setters.put("WH_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        WH_CODE = (String)value;
      }
    });
    setters.put("ERP_HEADER_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ERP_HEADER_ID = (String)value;
      }
    });
  }
  public W_SL_ORDER_PERFORM_F_GDH() {
    init0();
  }
  private String DATASOURCE_ID;
  public String get_DATASOURCE_ID() {
    return DATASOURCE_ID;
  }
  public void set_DATASOURCE_ID(String DATASOURCE_ID) {
    this.DATASOURCE_ID = DATASOURCE_ID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_DATASOURCE_ID(String DATASOURCE_ID) {
    this.DATASOURCE_ID = DATASOURCE_ID;
    return this;
  }
  private String INTEGRATION_ID;
  public String get_INTEGRATION_ID() {
    return INTEGRATION_ID;
  }
  public void set_INTEGRATION_ID(String INTEGRATION_ID) {
    this.INTEGRATION_ID = INTEGRATION_ID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_INTEGRATION_ID(String INTEGRATION_ID) {
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
  public W_SL_ORDER_PERFORM_F_GDH with_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
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
  public W_SL_ORDER_PERFORM_F_GDH with_W_UPDATE_DT(java.sql.Timestamp W_UPDATE_DT) {
    this.W_UPDATE_DT = W_UPDATE_DT;
    return this;
  }
  private String HEADER_ID;
  public String get_HEADER_ID() {
    return HEADER_ID;
  }
  public void set_HEADER_ID(String HEADER_ID) {
    this.HEADER_ID = HEADER_ID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_HEADER_ID(String HEADER_ID) {
    this.HEADER_ID = HEADER_ID;
    return this;
  }
  private String ORDER_NUMBER;
  public String get_ORDER_NUMBER() {
    return ORDER_NUMBER;
  }
  public void set_ORDER_NUMBER(String ORDER_NUMBER) {
    this.ORDER_NUMBER = ORDER_NUMBER;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_ORDER_NUMBER(String ORDER_NUMBER) {
    this.ORDER_NUMBER = ORDER_NUMBER;
    return this;
  }
  private java.sql.Timestamp BOOKED_DATE;
  public java.sql.Timestamp get_BOOKED_DATE() {
    return BOOKED_DATE;
  }
  public void set_BOOKED_DATE(java.sql.Timestamp BOOKED_DATE) {
    this.BOOKED_DATE = BOOKED_DATE;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_BOOKED_DATE(java.sql.Timestamp BOOKED_DATE) {
    this.BOOKED_DATE = BOOKED_DATE;
    return this;
  }
  private java.math.BigDecimal BOOKED_DT_WID;
  public java.math.BigDecimal get_BOOKED_DT_WID() {
    return BOOKED_DT_WID;
  }
  public void set_BOOKED_DT_WID(java.math.BigDecimal BOOKED_DT_WID) {
    this.BOOKED_DT_WID = BOOKED_DT_WID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_BOOKED_DT_WID(java.math.BigDecimal BOOKED_DT_WID) {
    this.BOOKED_DT_WID = BOOKED_DT_WID;
    return this;
  }
  private String BG_NAME;
  public String get_BG_NAME() {
    return BG_NAME;
  }
  public void set_BG_NAME(String BG_NAME) {
    this.BG_NAME = BG_NAME;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_BG_NAME(String BG_NAME) {
    this.BG_NAME = BG_NAME;
    return this;
  }
  private String AREA_FIVE_CODE;
  public String get_AREA_FIVE_CODE() {
    return AREA_FIVE_CODE;
  }
  public void set_AREA_FIVE_CODE(String AREA_FIVE_CODE) {
    this.AREA_FIVE_CODE = AREA_FIVE_CODE;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_AREA_FIVE_CODE(String AREA_FIVE_CODE) {
    this.AREA_FIVE_CODE = AREA_FIVE_CODE;
    return this;
  }
  private String DEALER_NAME;
  public String get_DEALER_NAME() {
    return DEALER_NAME;
  }
  public void set_DEALER_NAME(String DEALER_NAME) {
    this.DEALER_NAME = DEALER_NAME;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_DEALER_NAME(String DEALER_NAME) {
    this.DEALER_NAME = DEALER_NAME;
    return this;
  }
  private String DEALER_CODE;
  public String get_DEALER_CODE() {
    return DEALER_CODE;
  }
  public void set_DEALER_CODE(String DEALER_CODE) {
    this.DEALER_CODE = DEALER_CODE;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_DEALER_CODE(String DEALER_CODE) {
    this.DEALER_CODE = DEALER_CODE;
    return this;
  }
  private String ORDER_TYPE;
  public String get_ORDER_TYPE() {
    return ORDER_TYPE;
  }
  public void set_ORDER_TYPE(String ORDER_TYPE) {
    this.ORDER_TYPE = ORDER_TYPE;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_ORDER_TYPE(String ORDER_TYPE) {
    this.ORDER_TYPE = ORDER_TYPE;
    return this;
  }
  private String CPBH;
  public String get_CPBH() {
    return CPBH;
  }
  public void set_CPBH(String CPBH) {
    this.CPBH = CPBH;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_CPBH(String CPBH) {
    this.CPBH = CPBH;
    return this;
  }
  private java.math.BigDecimal DOWN_QTY;
  public java.math.BigDecimal get_DOWN_QTY() {
    return DOWN_QTY;
  }
  public void set_DOWN_QTY(java.math.BigDecimal DOWN_QTY) {
    this.DOWN_QTY = DOWN_QTY;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_DOWN_QTY(java.math.BigDecimal DOWN_QTY) {
    this.DOWN_QTY = DOWN_QTY;
    return this;
  }
  private java.math.BigDecimal DOWN_WHT;
  public java.math.BigDecimal get_DOWN_WHT() {
    return DOWN_WHT;
  }
  public void set_DOWN_WHT(java.math.BigDecimal DOWN_WHT) {
    this.DOWN_WHT = DOWN_WHT;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_DOWN_WHT(java.math.BigDecimal DOWN_WHT) {
    this.DOWN_WHT = DOWN_WHT;
    return this;
  }
  private java.math.BigDecimal DOWN_PROD;
  public java.math.BigDecimal get_DOWN_PROD() {
    return DOWN_PROD;
  }
  public void set_DOWN_PROD(java.math.BigDecimal DOWN_PROD) {
    this.DOWN_PROD = DOWN_PROD;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_DOWN_PROD(java.math.BigDecimal DOWN_PROD) {
    this.DOWN_PROD = DOWN_PROD;
    return this;
  }
  private java.math.BigDecimal UP_QTY;
  public java.math.BigDecimal get_UP_QTY() {
    return UP_QTY;
  }
  public void set_UP_QTY(java.math.BigDecimal UP_QTY) {
    this.UP_QTY = UP_QTY;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_UP_QTY(java.math.BigDecimal UP_QTY) {
    this.UP_QTY = UP_QTY;
    return this;
  }
  private java.math.BigDecimal UP_WHT;
  public java.math.BigDecimal get_UP_WHT() {
    return UP_WHT;
  }
  public void set_UP_WHT(java.math.BigDecimal UP_WHT) {
    this.UP_WHT = UP_WHT;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_UP_WHT(java.math.BigDecimal UP_WHT) {
    this.UP_WHT = UP_WHT;
    return this;
  }
  private java.math.BigDecimal UP_PROD;
  public java.math.BigDecimal get_UP_PROD() {
    return UP_PROD;
  }
  public void set_UP_PROD(java.math.BigDecimal UP_PROD) {
    this.UP_PROD = UP_PROD;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_UP_PROD(java.math.BigDecimal UP_PROD) {
    this.UP_PROD = UP_PROD;
    return this;
  }
  private java.math.BigDecimal BG_WID;
  public java.math.BigDecimal get_BG_WID() {
    return BG_WID;
  }
  public void set_BG_WID(java.math.BigDecimal BG_WID) {
    this.BG_WID = BG_WID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_BG_WID(java.math.BigDecimal BG_WID) {
    this.BG_WID = BG_WID;
    return this;
  }
  private java.math.BigDecimal DEALER_WID;
  public java.math.BigDecimal get_DEALER_WID() {
    return DEALER_WID;
  }
  public void set_DEALER_WID(java.math.BigDecimal DEALER_WID) {
    this.DEALER_WID = DEALER_WID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_DEALER_WID(java.math.BigDecimal DEALER_WID) {
    this.DEALER_WID = DEALER_WID;
    return this;
  }
  private java.math.BigDecimal PRODUCT_WID;
  public java.math.BigDecimal get_PRODUCT_WID() {
    return PRODUCT_WID;
  }
  public void set_PRODUCT_WID(java.math.BigDecimal PRODUCT_WID) {
    this.PRODUCT_WID = PRODUCT_WID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_PRODUCT_WID(java.math.BigDecimal PRODUCT_WID) {
    this.PRODUCT_WID = PRODUCT_WID;
    return this;
  }
  private java.sql.Timestamp ETL_RUN_TIME;
  public java.sql.Timestamp get_ETL_RUN_TIME() {
    return ETL_RUN_TIME;
  }
  public void set_ETL_RUN_TIME(java.sql.Timestamp ETL_RUN_TIME) {
    this.ETL_RUN_TIME = ETL_RUN_TIME;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_ETL_RUN_TIME(java.sql.Timestamp ETL_RUN_TIME) {
    this.ETL_RUN_TIME = ETL_RUN_TIME;
    return this;
  }
  private java.math.BigDecimal AREA_WID;
  public java.math.BigDecimal get_AREA_WID() {
    return AREA_WID;
  }
  public void set_AREA_WID(java.math.BigDecimal AREA_WID) {
    this.AREA_WID = AREA_WID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_AREA_WID(java.math.BigDecimal AREA_WID) {
    this.AREA_WID = AREA_WID;
    return this;
  }
  private java.math.BigDecimal REQUEST_WID;
  public java.math.BigDecimal get_REQUEST_WID() {
    return REQUEST_WID;
  }
  public void set_REQUEST_WID(java.math.BigDecimal REQUEST_WID) {
    this.REQUEST_WID = REQUEST_WID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_REQUEST_WID(java.math.BigDecimal REQUEST_WID) {
    this.REQUEST_WID = REQUEST_WID;
    return this;
  }
  private java.math.BigDecimal WH_WID;
  public java.math.BigDecimal get_WH_WID() {
    return WH_WID;
  }
  public void set_WH_WID(java.math.BigDecimal WH_WID) {
    this.WH_WID = WH_WID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_WH_WID(java.math.BigDecimal WH_WID) {
    this.WH_WID = WH_WID;
    return this;
  }
  private String REQUEST_TYPE;
  public String get_REQUEST_TYPE() {
    return REQUEST_TYPE;
  }
  public void set_REQUEST_TYPE(String REQUEST_TYPE) {
    this.REQUEST_TYPE = REQUEST_TYPE;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_REQUEST_TYPE(String REQUEST_TYPE) {
    this.REQUEST_TYPE = REQUEST_TYPE;
    return this;
  }
  private String WH_CODE;
  public String get_WH_CODE() {
    return WH_CODE;
  }
  public void set_WH_CODE(String WH_CODE) {
    this.WH_CODE = WH_CODE;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_WH_CODE(String WH_CODE) {
    this.WH_CODE = WH_CODE;
    return this;
  }
  private String ERP_HEADER_ID;
  public String get_ERP_HEADER_ID() {
    return ERP_HEADER_ID;
  }
  public void set_ERP_HEADER_ID(String ERP_HEADER_ID) {
    this.ERP_HEADER_ID = ERP_HEADER_ID;
  }
  public W_SL_ORDER_PERFORM_F_GDH with_ERP_HEADER_ID(String ERP_HEADER_ID) {
    this.ERP_HEADER_ID = ERP_HEADER_ID;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_SL_ORDER_PERFORM_F_GDH)) {
      return false;
    }
    W_SL_ORDER_PERFORM_F_GDH that = (W_SL_ORDER_PERFORM_F_GDH) o;
    boolean equal = true;
    equal = equal && (this.DATASOURCE_ID == null ? that.DATASOURCE_ID == null : this.DATASOURCE_ID.equals(that.DATASOURCE_ID));
    equal = equal && (this.INTEGRATION_ID == null ? that.INTEGRATION_ID == null : this.INTEGRATION_ID.equals(that.INTEGRATION_ID));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.W_UPDATE_DT == null ? that.W_UPDATE_DT == null : this.W_UPDATE_DT.equals(that.W_UPDATE_DT));
    equal = equal && (this.HEADER_ID == null ? that.HEADER_ID == null : this.HEADER_ID.equals(that.HEADER_ID));
    equal = equal && (this.ORDER_NUMBER == null ? that.ORDER_NUMBER == null : this.ORDER_NUMBER.equals(that.ORDER_NUMBER));
    equal = equal && (this.BOOKED_DATE == null ? that.BOOKED_DATE == null : this.BOOKED_DATE.equals(that.BOOKED_DATE));
    equal = equal && (this.BOOKED_DT_WID == null ? that.BOOKED_DT_WID == null : this.BOOKED_DT_WID.equals(that.BOOKED_DT_WID));
    equal = equal && (this.BG_NAME == null ? that.BG_NAME == null : this.BG_NAME.equals(that.BG_NAME));
    equal = equal && (this.AREA_FIVE_CODE == null ? that.AREA_FIVE_CODE == null : this.AREA_FIVE_CODE.equals(that.AREA_FIVE_CODE));
    equal = equal && (this.DEALER_NAME == null ? that.DEALER_NAME == null : this.DEALER_NAME.equals(that.DEALER_NAME));
    equal = equal && (this.DEALER_CODE == null ? that.DEALER_CODE == null : this.DEALER_CODE.equals(that.DEALER_CODE));
    equal = equal && (this.ORDER_TYPE == null ? that.ORDER_TYPE == null : this.ORDER_TYPE.equals(that.ORDER_TYPE));
    equal = equal && (this.CPBH == null ? that.CPBH == null : this.CPBH.equals(that.CPBH));
    equal = equal && (this.DOWN_QTY == null ? that.DOWN_QTY == null : this.DOWN_QTY.equals(that.DOWN_QTY));
    equal = equal && (this.DOWN_WHT == null ? that.DOWN_WHT == null : this.DOWN_WHT.equals(that.DOWN_WHT));
    equal = equal && (this.DOWN_PROD == null ? that.DOWN_PROD == null : this.DOWN_PROD.equals(that.DOWN_PROD));
    equal = equal && (this.UP_QTY == null ? that.UP_QTY == null : this.UP_QTY.equals(that.UP_QTY));
    equal = equal && (this.UP_WHT == null ? that.UP_WHT == null : this.UP_WHT.equals(that.UP_WHT));
    equal = equal && (this.UP_PROD == null ? that.UP_PROD == null : this.UP_PROD.equals(that.UP_PROD));
    equal = equal && (this.BG_WID == null ? that.BG_WID == null : this.BG_WID.equals(that.BG_WID));
    equal = equal && (this.DEALER_WID == null ? that.DEALER_WID == null : this.DEALER_WID.equals(that.DEALER_WID));
    equal = equal && (this.PRODUCT_WID == null ? that.PRODUCT_WID == null : this.PRODUCT_WID.equals(that.PRODUCT_WID));
    equal = equal && (this.ETL_RUN_TIME == null ? that.ETL_RUN_TIME == null : this.ETL_RUN_TIME.equals(that.ETL_RUN_TIME));
    equal = equal && (this.AREA_WID == null ? that.AREA_WID == null : this.AREA_WID.equals(that.AREA_WID));
    equal = equal && (this.REQUEST_WID == null ? that.REQUEST_WID == null : this.REQUEST_WID.equals(that.REQUEST_WID));
    equal = equal && (this.WH_WID == null ? that.WH_WID == null : this.WH_WID.equals(that.WH_WID));
    equal = equal && (this.REQUEST_TYPE == null ? that.REQUEST_TYPE == null : this.REQUEST_TYPE.equals(that.REQUEST_TYPE));
    equal = equal && (this.WH_CODE == null ? that.WH_CODE == null : this.WH_CODE.equals(that.WH_CODE));
    equal = equal && (this.ERP_HEADER_ID == null ? that.ERP_HEADER_ID == null : this.ERP_HEADER_ID.equals(that.ERP_HEADER_ID));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_SL_ORDER_PERFORM_F_GDH)) {
      return false;
    }
    W_SL_ORDER_PERFORM_F_GDH that = (W_SL_ORDER_PERFORM_F_GDH) o;
    boolean equal = true;
    equal = equal && (this.DATASOURCE_ID == null ? that.DATASOURCE_ID == null : this.DATASOURCE_ID.equals(that.DATASOURCE_ID));
    equal = equal && (this.INTEGRATION_ID == null ? that.INTEGRATION_ID == null : this.INTEGRATION_ID.equals(that.INTEGRATION_ID));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.W_UPDATE_DT == null ? that.W_UPDATE_DT == null : this.W_UPDATE_DT.equals(that.W_UPDATE_DT));
    equal = equal && (this.HEADER_ID == null ? that.HEADER_ID == null : this.HEADER_ID.equals(that.HEADER_ID));
    equal = equal && (this.ORDER_NUMBER == null ? that.ORDER_NUMBER == null : this.ORDER_NUMBER.equals(that.ORDER_NUMBER));
    equal = equal && (this.BOOKED_DATE == null ? that.BOOKED_DATE == null : this.BOOKED_DATE.equals(that.BOOKED_DATE));
    equal = equal && (this.BOOKED_DT_WID == null ? that.BOOKED_DT_WID == null : this.BOOKED_DT_WID.equals(that.BOOKED_DT_WID));
    equal = equal && (this.BG_NAME == null ? that.BG_NAME == null : this.BG_NAME.equals(that.BG_NAME));
    equal = equal && (this.AREA_FIVE_CODE == null ? that.AREA_FIVE_CODE == null : this.AREA_FIVE_CODE.equals(that.AREA_FIVE_CODE));
    equal = equal && (this.DEALER_NAME == null ? that.DEALER_NAME == null : this.DEALER_NAME.equals(that.DEALER_NAME));
    equal = equal && (this.DEALER_CODE == null ? that.DEALER_CODE == null : this.DEALER_CODE.equals(that.DEALER_CODE));
    equal = equal && (this.ORDER_TYPE == null ? that.ORDER_TYPE == null : this.ORDER_TYPE.equals(that.ORDER_TYPE));
    equal = equal && (this.CPBH == null ? that.CPBH == null : this.CPBH.equals(that.CPBH));
    equal = equal && (this.DOWN_QTY == null ? that.DOWN_QTY == null : this.DOWN_QTY.equals(that.DOWN_QTY));
    equal = equal && (this.DOWN_WHT == null ? that.DOWN_WHT == null : this.DOWN_WHT.equals(that.DOWN_WHT));
    equal = equal && (this.DOWN_PROD == null ? that.DOWN_PROD == null : this.DOWN_PROD.equals(that.DOWN_PROD));
    equal = equal && (this.UP_QTY == null ? that.UP_QTY == null : this.UP_QTY.equals(that.UP_QTY));
    equal = equal && (this.UP_WHT == null ? that.UP_WHT == null : this.UP_WHT.equals(that.UP_WHT));
    equal = equal && (this.UP_PROD == null ? that.UP_PROD == null : this.UP_PROD.equals(that.UP_PROD));
    equal = equal && (this.BG_WID == null ? that.BG_WID == null : this.BG_WID.equals(that.BG_WID));
    equal = equal && (this.DEALER_WID == null ? that.DEALER_WID == null : this.DEALER_WID.equals(that.DEALER_WID));
    equal = equal && (this.PRODUCT_WID == null ? that.PRODUCT_WID == null : this.PRODUCT_WID.equals(that.PRODUCT_WID));
    equal = equal && (this.ETL_RUN_TIME == null ? that.ETL_RUN_TIME == null : this.ETL_RUN_TIME.equals(that.ETL_RUN_TIME));
    equal = equal && (this.AREA_WID == null ? that.AREA_WID == null : this.AREA_WID.equals(that.AREA_WID));
    equal = equal && (this.REQUEST_WID == null ? that.REQUEST_WID == null : this.REQUEST_WID.equals(that.REQUEST_WID));
    equal = equal && (this.WH_WID == null ? that.WH_WID == null : this.WH_WID.equals(that.WH_WID));
    equal = equal && (this.REQUEST_TYPE == null ? that.REQUEST_TYPE == null : this.REQUEST_TYPE.equals(that.REQUEST_TYPE));
    equal = equal && (this.WH_CODE == null ? that.WH_CODE == null : this.WH_CODE.equals(that.WH_CODE));
    equal = equal && (this.ERP_HEADER_ID == null ? that.ERP_HEADER_ID == null : this.ERP_HEADER_ID.equals(that.ERP_HEADER_ID));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.DATASOURCE_ID = JdbcWritableBridge.readString(1, __dbResults);
    this.INTEGRATION_ID = JdbcWritableBridge.readString(2, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(3, __dbResults);
    this.W_UPDATE_DT = JdbcWritableBridge.readTimestamp(4, __dbResults);
    this.HEADER_ID = JdbcWritableBridge.readString(5, __dbResults);
    this.ORDER_NUMBER = JdbcWritableBridge.readString(6, __dbResults);
    this.BOOKED_DATE = JdbcWritableBridge.readTimestamp(7, __dbResults);
    this.BOOKED_DT_WID = JdbcWritableBridge.readBigDecimal(8, __dbResults);
    this.BG_NAME = JdbcWritableBridge.readString(9, __dbResults);
    this.AREA_FIVE_CODE = JdbcWritableBridge.readString(10, __dbResults);
    this.DEALER_NAME = JdbcWritableBridge.readString(11, __dbResults);
    this.DEALER_CODE = JdbcWritableBridge.readString(12, __dbResults);
    this.ORDER_TYPE = JdbcWritableBridge.readString(13, __dbResults);
    this.CPBH = JdbcWritableBridge.readString(14, __dbResults);
    this.DOWN_QTY = JdbcWritableBridge.readBigDecimal(15, __dbResults);
    this.DOWN_WHT = JdbcWritableBridge.readBigDecimal(16, __dbResults);
    this.DOWN_PROD = JdbcWritableBridge.readBigDecimal(17, __dbResults);
    this.UP_QTY = JdbcWritableBridge.readBigDecimal(18, __dbResults);
    this.UP_WHT = JdbcWritableBridge.readBigDecimal(19, __dbResults);
    this.UP_PROD = JdbcWritableBridge.readBigDecimal(20, __dbResults);
    this.BG_WID = JdbcWritableBridge.readBigDecimal(21, __dbResults);
    this.DEALER_WID = JdbcWritableBridge.readBigDecimal(22, __dbResults);
    this.PRODUCT_WID = JdbcWritableBridge.readBigDecimal(23, __dbResults);
    this.ETL_RUN_TIME = JdbcWritableBridge.readTimestamp(24, __dbResults);
    this.AREA_WID = JdbcWritableBridge.readBigDecimal(25, __dbResults);
    this.REQUEST_WID = JdbcWritableBridge.readBigDecimal(26, __dbResults);
    this.WH_WID = JdbcWritableBridge.readBigDecimal(27, __dbResults);
    this.REQUEST_TYPE = JdbcWritableBridge.readString(28, __dbResults);
    this.WH_CODE = JdbcWritableBridge.readString(29, __dbResults);
    this.ERP_HEADER_ID = JdbcWritableBridge.readString(30, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.DATASOURCE_ID = JdbcWritableBridge.readString(1, __dbResults);
    this.INTEGRATION_ID = JdbcWritableBridge.readString(2, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(3, __dbResults);
    this.W_UPDATE_DT = JdbcWritableBridge.readTimestamp(4, __dbResults);
    this.HEADER_ID = JdbcWritableBridge.readString(5, __dbResults);
    this.ORDER_NUMBER = JdbcWritableBridge.readString(6, __dbResults);
    this.BOOKED_DATE = JdbcWritableBridge.readTimestamp(7, __dbResults);
    this.BOOKED_DT_WID = JdbcWritableBridge.readBigDecimal(8, __dbResults);
    this.BG_NAME = JdbcWritableBridge.readString(9, __dbResults);
    this.AREA_FIVE_CODE = JdbcWritableBridge.readString(10, __dbResults);
    this.DEALER_NAME = JdbcWritableBridge.readString(11, __dbResults);
    this.DEALER_CODE = JdbcWritableBridge.readString(12, __dbResults);
    this.ORDER_TYPE = JdbcWritableBridge.readString(13, __dbResults);
    this.CPBH = JdbcWritableBridge.readString(14, __dbResults);
    this.DOWN_QTY = JdbcWritableBridge.readBigDecimal(15, __dbResults);
    this.DOWN_WHT = JdbcWritableBridge.readBigDecimal(16, __dbResults);
    this.DOWN_PROD = JdbcWritableBridge.readBigDecimal(17, __dbResults);
    this.UP_QTY = JdbcWritableBridge.readBigDecimal(18, __dbResults);
    this.UP_WHT = JdbcWritableBridge.readBigDecimal(19, __dbResults);
    this.UP_PROD = JdbcWritableBridge.readBigDecimal(20, __dbResults);
    this.BG_WID = JdbcWritableBridge.readBigDecimal(21, __dbResults);
    this.DEALER_WID = JdbcWritableBridge.readBigDecimal(22, __dbResults);
    this.PRODUCT_WID = JdbcWritableBridge.readBigDecimal(23, __dbResults);
    this.ETL_RUN_TIME = JdbcWritableBridge.readTimestamp(24, __dbResults);
    this.AREA_WID = JdbcWritableBridge.readBigDecimal(25, __dbResults);
    this.REQUEST_WID = JdbcWritableBridge.readBigDecimal(26, __dbResults);
    this.WH_WID = JdbcWritableBridge.readBigDecimal(27, __dbResults);
    this.REQUEST_TYPE = JdbcWritableBridge.readString(28, __dbResults);
    this.WH_CODE = JdbcWritableBridge.readString(29, __dbResults);
    this.ERP_HEADER_ID = JdbcWritableBridge.readString(30, __dbResults);
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
    JdbcWritableBridge.writeString(DATASOURCE_ID, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(INTEGRATION_ID, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 3 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_UPDATE_DT, 4 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(HEADER_ID, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ORDER_NUMBER, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(BOOKED_DATE, 7 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(BOOKED_DT_WID, 8 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(BG_NAME, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(AREA_FIVE_CODE, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_NAME, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_CODE, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ORDER_TYPE, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CPBH, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(DOWN_QTY, 15 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(DOWN_WHT, 16 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(DOWN_PROD, 17 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(UP_QTY, 18 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(UP_WHT, 19 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(UP_PROD, 20 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(BG_WID, 21 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(DEALER_WID, 22 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(PRODUCT_WID, 23 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(ETL_RUN_TIME, 24 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AREA_WID, 25 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(REQUEST_WID, 26 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(WH_WID, 27 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(REQUEST_TYPE, 28 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(WH_CODE, 29 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ERP_HEADER_ID, 30 + __off, 12, __dbStmt);
    return 30;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(DATASOURCE_ID, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(INTEGRATION_ID, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 3 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_UPDATE_DT, 4 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(HEADER_ID, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ORDER_NUMBER, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(BOOKED_DATE, 7 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(BOOKED_DT_WID, 8 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(BG_NAME, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(AREA_FIVE_CODE, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_NAME, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_CODE, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ORDER_TYPE, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CPBH, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(DOWN_QTY, 15 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(DOWN_WHT, 16 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(DOWN_PROD, 17 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(UP_QTY, 18 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(UP_WHT, 19 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(UP_PROD, 20 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(BG_WID, 21 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(DEALER_WID, 22 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(PRODUCT_WID, 23 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(ETL_RUN_TIME, 24 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AREA_WID, 25 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(REQUEST_WID, 26 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(WH_WID, 27 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(REQUEST_TYPE, 28 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(WH_CODE, 29 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ERP_HEADER_ID, 30 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.DATASOURCE_ID = null;
    } else {
    this.DATASOURCE_ID = Text.readString(__dataIn);
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
        this.HEADER_ID = null;
    } else {
    this.HEADER_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ORDER_NUMBER = null;
    } else {
    this.ORDER_NUMBER = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BOOKED_DATE = null;
    } else {
    this.BOOKED_DATE = new Timestamp(__dataIn.readLong());
    this.BOOKED_DATE.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.BOOKED_DT_WID = null;
    } else {
    this.BOOKED_DT_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_NAME = null;
    } else {
    this.BG_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.AREA_FIVE_CODE = null;
    } else {
    this.AREA_FIVE_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_NAME = null;
    } else {
    this.DEALER_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_CODE = null;
    } else {
    this.DEALER_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ORDER_TYPE = null;
    } else {
    this.ORDER_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CPBH = null;
    } else {
    this.CPBH = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DOWN_QTY = null;
    } else {
    this.DOWN_QTY = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DOWN_WHT = null;
    } else {
    this.DOWN_WHT = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DOWN_PROD = null;
    } else {
    this.DOWN_PROD = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.UP_QTY = null;
    } else {
    this.UP_QTY = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.UP_WHT = null;
    } else {
    this.UP_WHT = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.UP_PROD = null;
    } else {
    this.UP_PROD = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_WID = null;
    } else {
    this.BG_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_WID = null;
    } else {
    this.DEALER_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.PRODUCT_WID = null;
    } else {
    this.PRODUCT_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ETL_RUN_TIME = null;
    } else {
    this.ETL_RUN_TIME = new Timestamp(__dataIn.readLong());
    this.ETL_RUN_TIME.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.AREA_WID = null;
    } else {
    this.AREA_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.REQUEST_WID = null;
    } else {
    this.REQUEST_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.WH_WID = null;
    } else {
    this.WH_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.REQUEST_TYPE = null;
    } else {
    this.REQUEST_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.WH_CODE = null;
    } else {
    this.WH_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ERP_HEADER_ID = null;
    } else {
    this.ERP_HEADER_ID = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.DATASOURCE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DATASOURCE_ID);
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
    if (null == this.HEADER_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, HEADER_ID);
    }
    if (null == this.ORDER_NUMBER) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORDER_NUMBER);
    }
    if (null == this.BOOKED_DATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.BOOKED_DATE.getTime());
    __dataOut.writeInt(this.BOOKED_DATE.getNanos());
    }
    if (null == this.BOOKED_DT_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.BOOKED_DT_WID, __dataOut);
    }
    if (null == this.BG_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_NAME);
    }
    if (null == this.AREA_FIVE_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, AREA_FIVE_CODE);
    }
    if (null == this.DEALER_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_NAME);
    }
    if (null == this.DEALER_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_CODE);
    }
    if (null == this.ORDER_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORDER_TYPE);
    }
    if (null == this.CPBH) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CPBH);
    }
    if (null == this.DOWN_QTY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.DOWN_QTY, __dataOut);
    }
    if (null == this.DOWN_WHT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.DOWN_WHT, __dataOut);
    }
    if (null == this.DOWN_PROD) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.DOWN_PROD, __dataOut);
    }
    if (null == this.UP_QTY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.UP_QTY, __dataOut);
    }
    if (null == this.UP_WHT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.UP_WHT, __dataOut);
    }
    if (null == this.UP_PROD) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.UP_PROD, __dataOut);
    }
    if (null == this.BG_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.BG_WID, __dataOut);
    }
    if (null == this.DEALER_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.DEALER_WID, __dataOut);
    }
    if (null == this.PRODUCT_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.PRODUCT_WID, __dataOut);
    }
    if (null == this.ETL_RUN_TIME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.ETL_RUN_TIME.getTime());
    __dataOut.writeInt(this.ETL_RUN_TIME.getNanos());
    }
    if (null == this.AREA_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AREA_WID, __dataOut);
    }
    if (null == this.REQUEST_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.REQUEST_WID, __dataOut);
    }
    if (null == this.WH_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.WH_WID, __dataOut);
    }
    if (null == this.REQUEST_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, REQUEST_TYPE);
    }
    if (null == this.WH_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, WH_CODE);
    }
    if (null == this.ERP_HEADER_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERP_HEADER_ID);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.DATASOURCE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DATASOURCE_ID);
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
    if (null == this.HEADER_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, HEADER_ID);
    }
    if (null == this.ORDER_NUMBER) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORDER_NUMBER);
    }
    if (null == this.BOOKED_DATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.BOOKED_DATE.getTime());
    __dataOut.writeInt(this.BOOKED_DATE.getNanos());
    }
    if (null == this.BOOKED_DT_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.BOOKED_DT_WID, __dataOut);
    }
    if (null == this.BG_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_NAME);
    }
    if (null == this.AREA_FIVE_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, AREA_FIVE_CODE);
    }
    if (null == this.DEALER_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_NAME);
    }
    if (null == this.DEALER_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_CODE);
    }
    if (null == this.ORDER_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORDER_TYPE);
    }
    if (null == this.CPBH) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CPBH);
    }
    if (null == this.DOWN_QTY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.DOWN_QTY, __dataOut);
    }
    if (null == this.DOWN_WHT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.DOWN_WHT, __dataOut);
    }
    if (null == this.DOWN_PROD) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.DOWN_PROD, __dataOut);
    }
    if (null == this.UP_QTY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.UP_QTY, __dataOut);
    }
    if (null == this.UP_WHT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.UP_WHT, __dataOut);
    }
    if (null == this.UP_PROD) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.UP_PROD, __dataOut);
    }
    if (null == this.BG_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.BG_WID, __dataOut);
    }
    if (null == this.DEALER_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.DEALER_WID, __dataOut);
    }
    if (null == this.PRODUCT_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.PRODUCT_WID, __dataOut);
    }
    if (null == this.ETL_RUN_TIME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.ETL_RUN_TIME.getTime());
    __dataOut.writeInt(this.ETL_RUN_TIME.getNanos());
    }
    if (null == this.AREA_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AREA_WID, __dataOut);
    }
    if (null == this.REQUEST_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.REQUEST_WID, __dataOut);
    }
    if (null == this.WH_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.WH_WID, __dataOut);
    }
    if (null == this.REQUEST_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, REQUEST_TYPE);
    }
    if (null == this.WH_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, WH_CODE);
    }
    if (null == this.ERP_HEADER_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERP_HEADER_ID);
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
    __sb.append(FieldFormatter.escapeAndEnclose(DATASOURCE_ID==null?"null":DATASOURCE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INTEGRATION_ID==null?"null":INTEGRATION_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"0":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_UPDATE_DT==null?"0":"" + W_UPDATE_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(HEADER_ID==null?"null":HEADER_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDER_NUMBER==null?"null":ORDER_NUMBER, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BOOKED_DATE==null?"0":"" + BOOKED_DATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BOOKED_DT_WID==null?"0":BOOKED_DT_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_NAME==null?"null":BG_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AREA_FIVE_CODE==null?"null":AREA_FIVE_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_NAME==null?"null":DEALER_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_CODE==null?"null":DEALER_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDER_TYPE==null?"null":ORDER_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CPBH==null?"null":CPBH, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DOWN_QTY==null?"0":DOWN_QTY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DOWN_WHT==null?"0":DOWN_WHT.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DOWN_PROD==null?"0":DOWN_PROD.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(UP_QTY==null?"0":UP_QTY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(UP_WHT==null?"0":UP_WHT.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(UP_PROD==null?"0":UP_PROD.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_WID==null?"0":BG_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_WID==null?"0":DEALER_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PRODUCT_WID==null?"0":PRODUCT_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ETL_RUN_TIME==null?"0":"" + ETL_RUN_TIME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AREA_WID==null?"0":AREA_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(REQUEST_WID==null?"0":REQUEST_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WH_WID==null?"0":WH_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(REQUEST_TYPE==null?"null":REQUEST_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WH_CODE==null?"null":WH_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERP_HEADER_ID==null?"null":ERP_HEADER_ID, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(DATASOURCE_ID==null?"null":DATASOURCE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INTEGRATION_ID==null?"null":INTEGRATION_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"0":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_UPDATE_DT==null?"0":"" + W_UPDATE_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(HEADER_ID==null?"null":HEADER_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDER_NUMBER==null?"null":ORDER_NUMBER, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BOOKED_DATE==null?"0":"" + BOOKED_DATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BOOKED_DT_WID==null?"0":BOOKED_DT_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_NAME==null?"null":BG_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AREA_FIVE_CODE==null?"null":AREA_FIVE_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_NAME==null?"null":DEALER_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_CODE==null?"null":DEALER_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDER_TYPE==null?"null":ORDER_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CPBH==null?"null":CPBH, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DOWN_QTY==null?"0":DOWN_QTY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DOWN_WHT==null?"0":DOWN_WHT.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DOWN_PROD==null?"0":DOWN_PROD.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(UP_QTY==null?"0":UP_QTY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(UP_WHT==null?"0":UP_WHT.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(UP_PROD==null?"0":UP_PROD.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_WID==null?"0":BG_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_WID==null?"0":DEALER_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PRODUCT_WID==null?"0":PRODUCT_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ETL_RUN_TIME==null?"0":"" + ETL_RUN_TIME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AREA_WID==null?"0":AREA_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(REQUEST_WID==null?"0":REQUEST_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WH_WID==null?"0":WH_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(REQUEST_TYPE==null?"null":REQUEST_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WH_CODE==null?"null":WH_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERP_HEADER_ID==null?"null":ERP_HEADER_ID, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 1, (char) 10, (char) 0, (char) 0, false);
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
    if (__cur_str.equals("\\N")) { this.DATASOURCE_ID = null; } else {
      this.DATASOURCE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.INTEGRATION_ID = null; } else {
      this.INTEGRATION_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.W_UPDATE_DT = null; } else {
      this.W_UPDATE_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.HEADER_ID = null; } else {
      this.HEADER_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.ORDER_NUMBER = null; } else {
      this.ORDER_NUMBER = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.BOOKED_DATE = null; } else {
      this.BOOKED_DATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.BOOKED_DT_WID = null; } else {
      this.BOOKED_DT_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.BG_NAME = null; } else {
      this.BG_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.AREA_FIVE_CODE = null; } else {
      this.AREA_FIVE_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.DEALER_NAME = null; } else {
      this.DEALER_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.DEALER_CODE = null; } else {
      this.DEALER_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.ORDER_TYPE = null; } else {
      this.ORDER_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.CPBH = null; } else {
      this.CPBH = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.DOWN_QTY = null; } else {
      this.DOWN_QTY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.DOWN_WHT = null; } else {
      this.DOWN_WHT = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.DOWN_PROD = null; } else {
      this.DOWN_PROD = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.UP_QTY = null; } else {
      this.UP_QTY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.UP_WHT = null; } else {
      this.UP_WHT = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.UP_PROD = null; } else {
      this.UP_PROD = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.BG_WID = null; } else {
      this.BG_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.DEALER_WID = null; } else {
      this.DEALER_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.PRODUCT_WID = null; } else {
      this.PRODUCT_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.ETL_RUN_TIME = null; } else {
      this.ETL_RUN_TIME = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.AREA_WID = null; } else {
      this.AREA_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.REQUEST_WID = null; } else {
      this.REQUEST_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.WH_WID = null; } else {
      this.WH_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.REQUEST_TYPE = null; } else {
      this.REQUEST_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.WH_CODE = null; } else {
      this.WH_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.ERP_HEADER_ID = null; } else {
      this.ERP_HEADER_ID = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.DATASOURCE_ID = null; } else {
      this.DATASOURCE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.INTEGRATION_ID = null; } else {
      this.INTEGRATION_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.W_UPDATE_DT = null; } else {
      this.W_UPDATE_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.HEADER_ID = null; } else {
      this.HEADER_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.ORDER_NUMBER = null; } else {
      this.ORDER_NUMBER = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.BOOKED_DATE = null; } else {
      this.BOOKED_DATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.BOOKED_DT_WID = null; } else {
      this.BOOKED_DT_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.BG_NAME = null; } else {
      this.BG_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.AREA_FIVE_CODE = null; } else {
      this.AREA_FIVE_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.DEALER_NAME = null; } else {
      this.DEALER_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.DEALER_CODE = null; } else {
      this.DEALER_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.ORDER_TYPE = null; } else {
      this.ORDER_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.CPBH = null; } else {
      this.CPBH = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.DOWN_QTY = null; } else {
      this.DOWN_QTY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.DOWN_WHT = null; } else {
      this.DOWN_WHT = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.DOWN_PROD = null; } else {
      this.DOWN_PROD = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.UP_QTY = null; } else {
      this.UP_QTY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.UP_WHT = null; } else {
      this.UP_WHT = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.UP_PROD = null; } else {
      this.UP_PROD = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.BG_WID = null; } else {
      this.BG_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.DEALER_WID = null; } else {
      this.DEALER_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.PRODUCT_WID = null; } else {
      this.PRODUCT_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.ETL_RUN_TIME = null; } else {
      this.ETL_RUN_TIME = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.AREA_WID = null; } else {
      this.AREA_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.REQUEST_WID = null; } else {
      this.REQUEST_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.WH_WID = null; } else {
      this.WH_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.REQUEST_TYPE = null; } else {
      this.REQUEST_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.WH_CODE = null; } else {
      this.WH_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.ERP_HEADER_ID = null; } else {
      this.ERP_HEADER_ID = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    W_SL_ORDER_PERFORM_F_GDH o = (W_SL_ORDER_PERFORM_F_GDH) super.clone();
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    o.W_UPDATE_DT = (o.W_UPDATE_DT != null) ? (java.sql.Timestamp) o.W_UPDATE_DT.clone() : null;
    o.BOOKED_DATE = (o.BOOKED_DATE != null) ? (java.sql.Timestamp) o.BOOKED_DATE.clone() : null;
    o.ETL_RUN_TIME = (o.ETL_RUN_TIME != null) ? (java.sql.Timestamp) o.ETL_RUN_TIME.clone() : null;
    return o;
  }

  public void clone0(W_SL_ORDER_PERFORM_F_GDH o) throws CloneNotSupportedException {
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    o.W_UPDATE_DT = (o.W_UPDATE_DT != null) ? (java.sql.Timestamp) o.W_UPDATE_DT.clone() : null;
    o.BOOKED_DATE = (o.BOOKED_DATE != null) ? (java.sql.Timestamp) o.BOOKED_DATE.clone() : null;
    o.ETL_RUN_TIME = (o.ETL_RUN_TIME != null) ? (java.sql.Timestamp) o.ETL_RUN_TIME.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("DATASOURCE_ID", this.DATASOURCE_ID);
    __sqoop$field_map.put("INTEGRATION_ID", this.INTEGRATION_ID);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("W_UPDATE_DT", this.W_UPDATE_DT);
    __sqoop$field_map.put("HEADER_ID", this.HEADER_ID);
    __sqoop$field_map.put("ORDER_NUMBER", this.ORDER_NUMBER);
    __sqoop$field_map.put("BOOKED_DATE", this.BOOKED_DATE);
    __sqoop$field_map.put("BOOKED_DT_WID", this.BOOKED_DT_WID);
    __sqoop$field_map.put("BG_NAME", this.BG_NAME);
    __sqoop$field_map.put("AREA_FIVE_CODE", this.AREA_FIVE_CODE);
    __sqoop$field_map.put("DEALER_NAME", this.DEALER_NAME);
    __sqoop$field_map.put("DEALER_CODE", this.DEALER_CODE);
    __sqoop$field_map.put("ORDER_TYPE", this.ORDER_TYPE);
    __sqoop$field_map.put("CPBH", this.CPBH);
    __sqoop$field_map.put("DOWN_QTY", this.DOWN_QTY);
    __sqoop$field_map.put("DOWN_WHT", this.DOWN_WHT);
    __sqoop$field_map.put("DOWN_PROD", this.DOWN_PROD);
    __sqoop$field_map.put("UP_QTY", this.UP_QTY);
    __sqoop$field_map.put("UP_WHT", this.UP_WHT);
    __sqoop$field_map.put("UP_PROD", this.UP_PROD);
    __sqoop$field_map.put("BG_WID", this.BG_WID);
    __sqoop$field_map.put("DEALER_WID", this.DEALER_WID);
    __sqoop$field_map.put("PRODUCT_WID", this.PRODUCT_WID);
    __sqoop$field_map.put("ETL_RUN_TIME", this.ETL_RUN_TIME);
    __sqoop$field_map.put("AREA_WID", this.AREA_WID);
    __sqoop$field_map.put("REQUEST_WID", this.REQUEST_WID);
    __sqoop$field_map.put("WH_WID", this.WH_WID);
    __sqoop$field_map.put("REQUEST_TYPE", this.REQUEST_TYPE);
    __sqoop$field_map.put("WH_CODE", this.WH_CODE);
    __sqoop$field_map.put("ERP_HEADER_ID", this.ERP_HEADER_ID);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("DATASOURCE_ID", this.DATASOURCE_ID);
    __sqoop$field_map.put("INTEGRATION_ID", this.INTEGRATION_ID);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("W_UPDATE_DT", this.W_UPDATE_DT);
    __sqoop$field_map.put("HEADER_ID", this.HEADER_ID);
    __sqoop$field_map.put("ORDER_NUMBER", this.ORDER_NUMBER);
    __sqoop$field_map.put("BOOKED_DATE", this.BOOKED_DATE);
    __sqoop$field_map.put("BOOKED_DT_WID", this.BOOKED_DT_WID);
    __sqoop$field_map.put("BG_NAME", this.BG_NAME);
    __sqoop$field_map.put("AREA_FIVE_CODE", this.AREA_FIVE_CODE);
    __sqoop$field_map.put("DEALER_NAME", this.DEALER_NAME);
    __sqoop$field_map.put("DEALER_CODE", this.DEALER_CODE);
    __sqoop$field_map.put("ORDER_TYPE", this.ORDER_TYPE);
    __sqoop$field_map.put("CPBH", this.CPBH);
    __sqoop$field_map.put("DOWN_QTY", this.DOWN_QTY);
    __sqoop$field_map.put("DOWN_WHT", this.DOWN_WHT);
    __sqoop$field_map.put("DOWN_PROD", this.DOWN_PROD);
    __sqoop$field_map.put("UP_QTY", this.UP_QTY);
    __sqoop$field_map.put("UP_WHT", this.UP_WHT);
    __sqoop$field_map.put("UP_PROD", this.UP_PROD);
    __sqoop$field_map.put("BG_WID", this.BG_WID);
    __sqoop$field_map.put("DEALER_WID", this.DEALER_WID);
    __sqoop$field_map.put("PRODUCT_WID", this.PRODUCT_WID);
    __sqoop$field_map.put("ETL_RUN_TIME", this.ETL_RUN_TIME);
    __sqoop$field_map.put("AREA_WID", this.AREA_WID);
    __sqoop$field_map.put("REQUEST_WID", this.REQUEST_WID);
    __sqoop$field_map.put("WH_WID", this.WH_WID);
    __sqoop$field_map.put("REQUEST_TYPE", this.REQUEST_TYPE);
    __sqoop$field_map.put("WH_CODE", this.WH_CODE);
    __sqoop$field_map.put("ERP_HEADER_ID", this.ERP_HEADER_ID);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
