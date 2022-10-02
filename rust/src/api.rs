use std::sync::atomic::{AtomicU64, Ordering};

static COUNTER: AtomicU64 = AtomicU64::new(0);
static CALC_RESULT: AtomicU64 = AtomicU64::new(0);

pub fn get_counter() -> u64 {
    COUNTER.load(Ordering::SeqCst)
}
pub fn increment() -> u64 {
    COUNTER.fetch_add(2, Ordering::SeqCst);
    COUNTER.load(Ordering::SeqCst)
}
pub fn decrement() -> u64 {
    COUNTER.fetch_sub(1, Ordering::SeqCst);
    COUNTER.load(Ordering::SeqCst)
}
pub fn get_result() -> u64 {
    CALC_RESULT.load(Ordering::SeqCst)
}
pub fn calculate_simple(args: Vec<String>) -> u64 {
    // CALC_RESULT.fetch_add(
    //     calculate(vec![
    //         "2".to_string(),
    //         "+".to_string(),
    //         "2".to_string(),
    //         "*".to_string(),
    //         "2".to_string(),
    //     ])
    //     .round() as u64,
    //     Ordering::SeqCst,
    // );
    CALC_RESULT.fetch_add(calculate(args).round() as u64, Ordering::SeqCst);
    CALC_RESULT.load(Ordering::SeqCst)
}
pub fn calculate_bongal(args: Vec<String>) -> String {
    return calculate27(args);
}
pub fn get_new_bongal() -> String {
    "".to_string()
}

pub fn calculate(args: Vec<String>) -> f64 {
    // let args: Vec<String> = msg
    //     .content
    //     .split(" ")
    //     .skip(1)
    //     .map(|f| f.to_string())
    //     .collect();
    // let args: Vec<String> = Vec::new();

    let mut result: f64 = 0.0;
    match calculate_section(&args, false, false) {
        Some(v) => {
            result = v;
        }
        None => {
            println!("error running calculation");
            return 0.0;
        }
    }

    // msg.channel_id
    //     .send_message(&ctx, |m| m.content(result.to_string()))
    //     ?;
    // msg.reply(&ctx, result.to_string())?;
    // Ok(())
    result
}

pub fn calculate_verbose() -> f64 {
    // let args: Vec<String> = msg
    //     .content
    //     .split(" ")
    //     .skip(1)
    //     .map(|f| f.to_string())
    //     .collect();
    let args: Vec<String> = Vec::new();

    let mut result: f64 = 0.0;
    match calculate_section(&args, true, false) {
        Some(v) => {
            result = v;
        }
        None => {
            println!("error running calculation");
            return 0.0;
        }
    }

    // msg.channel_id
    //     .send_message(&ctx, |m| m.content(result.to_string()))
    //     ?;
    // msg.reply(&ctx, result.to_string())?;
    // Ok(())
    result
}
pub fn calculate27(args: Vec<String>) -> String {
    // let args: Vec<String> = msg
    //     .content
    //     .split(" ")
    //     .skip(1)
    //     .map(|f| f.to_string())
    //     .collect();
    // let args: Vec<String> = Vec::new();

    let mut result: f64 = 0.0;
    match calculate_section(&args, false, true) {
        Some(v) => {
            result = v;
        }
        None => {
            println!("error running calculation");
            return "INVALID".to_string();
        }
    }

    // msg.channel_id
    //     .send_message(&ctx, |m| m.content(result.to_string()))
    //     ?;
    // msg.reply(
    //     &ctx,
    //     match to_bongal(result.to_string()) {
    //         Some(v) => v,
    //         None => "error".to_string(),
    //     },
    // )
    // ?;
    // Ok(())
    match to_bongal(result.to_string()) {
        Some(v) => {
            return v;
        }
        None => {
            return "INVALID".to_string();
        }
    }
}

fn calculate_section(suply_args: &Vec<String>, verbose: bool, is_bongal: bool) -> Option<f64> {
    let mut args: Vec<String> = suply_args.into_iter().map(|f| f.to_string()).collect();
    let mut result_f: f64 = 0.0;
    // println!("{:?}", args);
    while args.contains(&"(".to_string()) {
        let mut index_open: usize = 0;
        let mut open_counter: usize = 0;
        let mut close_counter: usize = 0;
        let mut index_close: usize = 0;
        for i in 0..args.len() {
            if args[i] == "(" {
                open_counter += 1;
                if open_counter == 1 {
                    index_open = i;
                }
            }
            if args[i] == ")" {
                close_counter += 1;
                if close_counter == open_counter {
                    index_close = i;
                    break;
                }
            }
        }
        // println!("open index at position: {}", index_open);
        // println!("close index at position: {}", index_close);

        let mut new_args: Vec<String> = args.clone().into_iter().skip(index_open + 1).collect();
        for _i in 0..(args.len() - index_close) {
            new_args.pop();
        }
        // println!("new args: {:?}", new_args);
        match calculate_section(&new_args, verbose, is_bongal) {
            Some(v) => {
                result_f = v;
            }
            None => (),
        };
        args[index_open] = result_f.to_string();

        // println!("args before () deletion: {:?}", args);
        for _i in 0..index_close - index_open {
            args.remove(index_open + 1);
        }
        // println!("args after () deletion: {:?}", args);
    }

    let mut result: f64 = 0.0;
    let mut numbers: Vec<f64> = Vec::new();
    let mut operators: Vec<String> = Vec::new();

    for i in 0..args.len() {
        match args[i].as_str() {
            "*" => operators.push(args[i].clone()),
            "+" => operators.push(args[i].clone()),
            "-" => operators.push(args[i].clone()),
            "/" => operators.push(args[i].clone()),
            _ => {
                if is_bongal {
                    match from_bongal(args[i].clone()) {
                        Some(v) => numbers.push(v),
                        None => {
                            println!("invalid bongal -> decimal conversion");
                            return None;
                        }
                    }
                    // numbers.push(from_bongal(args[i].clone()));
                } else {
                    match args[i].parse::<f64>() {
                        Ok(v) => numbers.push(v),
                        Err(e) => {
                            println!("{}", e);
                            return None;
                        }
                    }
                }
            }
        }
    }

    if numbers.len() != operators.len() + 1 {
        println!("invalid syntax");
        return None;
    }
    // println!("{:?}", numbers);
    // println!("{:?}", operators);

    while operators.contains(&"*".to_string()) || operators.contains(&"/".to_string()) {
        let mut _index: usize = 0;
        let mut index_m: usize = 10000;
        let mut index_d: usize = 10000;
        let mut is_div: bool = true;
        for i in 0..operators.len() {
            if operators[i] == "*" {
                index_m = i;
                break;
            }
        }
        for i in 0..operators.len() {
            if operators[i] == "/" {
                index_d = i;
                break;
            }
        }
        if index_d < index_m {
            _index = index_d;
            // is_div = true;
        } else {
            _index = index_m;
            is_div = false;
        }

        let num: f64 = if is_div {
            numbers[_index] / numbers[_index + 1]
        } else {
            numbers[_index] * numbers[_index + 1]
        };

        if verbose {
            let message: String = if is_div { "dividing " } else { "multiplying " }.to_string()
                + numbers[_index].to_string().as_str()
                + " by "
                + numbers[_index + 1].to_string().as_str();
            println!("{}", message);
        }

        numbers.remove(_index + 1);
        numbers[_index] = num;
        operators.remove(_index);
    }

    for i in 0..numbers.len() {
        if i == 0 {
            result = numbers[0];
            continue;
        }
        match operators[i - 1].as_str() {
            "-" => {
                if verbose {
                    let message: String = "substracting ".to_string()
                        + numbers[i].to_string().as_str()
                        + " from "
                        + result.to_string().as_str();
                    println!("{}", message);
                }
                result = result - numbers[i];
            }
            "+" => {
                if verbose {
                    let message: String = "adding ".to_string()
                        + numbers[i].to_string().as_str()
                        + " to "
                        + result.to_string().as_str();
                    println!("{}", message);
                }
                result = result + numbers[i];
            }
            _ => {
                result = result;
            }
        }
    }

    Some(result)
}

fn bongal() {
    // let args: Vec<&str> = msg.content.split(" ").skip(1).collect();
    let args: Vec<&str> = Vec::new();
    let mut bongal: String = String::new();
    match to_bongal(args[0].to_string()) {
        Some(v) => {
            bongal = v;
        }
        None => {
            println!("invalid bongal");
            // msg.reply(&ctx, "invalid bongal").unwrap();
            // return Ok(());
        }
    }

    // msg.reply(&ctx, bongal)?;

    // Ok(())
}
fn decimal() {
    // let args: Vec<&str> = msg.content.split(" ").skip(1).collect();
    let args: Vec<&str> = Vec::new();
    let mut decimal: f64 = 0.0;

    match from_bongal(args[0].to_string()) {
        Some(v) => decimal = v,
        None => {
            println!("invalid bongal -> decimal conversion");
            // msg.reply(&ctx, "invalid bongal->decimal conversion")
            //
            //     .unwrap();
            // return Ok(());
        }
    }
    // msg.reply(&ctx, decimal)?;

    // Ok(())
}

fn to_bongal(decimal: String) -> Option<String> {
    let mut decimal = decimal;
    let mut result: String = String::new();

    let mut value_int: u128 = 0;
    let mut value_after = 0.0;
    let is_under: bool = decimal.contains("-");
    if is_under {
        decimal.remove(0);
    }

    if decimal.contains(".") {
        let cropped_decimal: Vec<&str> = decimal.split(".").collect();
        value_int = cropped_decimal[0]
            .parse::<u128>()
            .expect("error parsing whole part of decimal to bongal");

        value_after = ("0.".to_string() + cropped_decimal[1])
            .as_str()
            .parse::<f64>()
            .expect("error parsing the rest of decimal to bongal");
    } else {
        value_int = decimal
            .parse::<u128>()
            .expect("error parsing value to bongal");
    }
    if is_under {
        result += "-";
    }

    while value_int > 1 {
        // println!("{}", value_int);
        match value_int % 27 {
            0 => result += "0",
            1 => result += "1",
            2 => result += "2",
            3 => result += "3",
            4 => result += "4",
            5 => result += "5",
            6 => result += "6",
            7 => result += "7",
            8 => result += "8",
            9 => result += "9",
            10 => result += "α",
            11 => result += "β",
            12 => result += "γ",
            13 => result += "δ",
            14 => result += "ρ",
            15 => result += "F",
            16 => result += "η",
            17 => result += "∅",
            18 => result += "c",
            19 => result += "K",
            20 => result += "ʎ",
            21 => result += "u",
            22 => result += "V",
            23 => result += "Ś",
            24 => result += "O",
            25 => result += "π",
            26 => result += "P",
            _ => return None,
        }
        value_int = value_int / 27;
    }
    let result_arr: Vec<String> = result.chars().map(|f| f.to_string()).rev().collect();
    result = "".to_string();
    for i in 0..result_arr.len() {
        result += result_arr[i].as_str();
    }

    if decimal.contains(".") {
        result += ".";
        for _i in 0..5 {
            value_after *= 27.0;

            let value_after_string: String = value_after.to_string().clone();
            let value_str: Vec<&str> = value_after_string.split(".").collect();

            // println!("{value_after} {}", value_str[0]);

            match value_str[0] {
                "0" => result += "0",
                "1" => result += "1",
                "2" => result += "2",
                "3" => result += "3",
                "4" => result += "4",
                "5" => result += "5",
                "6" => result += "6",
                "7" => result += "7",
                "8" => result += "8",
                "9" => result += "9",
                "10" => result += "α",
                "11" => result += "β",
                "12" => result += "γ",
                "13" => result += "δ",
                "14" => result += "ρ",
                "15" => result += "F",
                "16" => result += "η",
                "17" => result += "∅",
                "18" => result += "c",
                "19" => result += "K",
                "20" => result += "ʎ",
                "21" => result += "u",
                "22" => result += "V",
                "23" => result += "Ś",
                "24" => result += "O",
                "25" => result += "π",
                "26" => result += "P",
                _ => return None,
            }
            value_after = value_after - value_after.floor();
        }
    }

    return Some(result);
}

fn from_bongal(bongal: String) -> Option<f64> {
    let mut result: f64 = 0.0;
    let mut is_below = false;
    // if is_below{

    // }
    let mut chars_after: Vec<String> = Vec::new();
    let mut chars_int: Vec<String> = Vec::new();
    if bongal.contains(".") {
        let cropped: Vec<&str> = bongal.split(".").collect();
        chars_int = cropped[0].chars().map(|f| f.to_string()).collect();
        chars_after = cropped[1].chars().map(|f| f.to_string()).collect();
    } else {
        chars_int = bongal.chars().map(|f| f.to_string()).collect();
    }
    if bongal.contains(&"-") {
        is_below = true;
        chars_int.remove(0);
    }
    chars_int.reverse();

    for i in 0..chars_int.len() {
        match chars_int[i].as_str() {
            "0" => result += 0.0 * (27u64.pow(i as u32)) as f64,
            "1" => result += 1.0 * (27u64.pow(i as u32)) as f64,
            "2" => result += 2.0 * (27u64.pow(i as u32)) as f64,
            "3" => result += 3.0 * (27u64.pow(i as u32)) as f64,
            "4" => result += 4.0 * (27u64.pow(i as u32)) as f64,
            "5" => result += 5.0 * (27u64.pow(i as u32)) as f64,
            "6" => result += 6.0 * (27u64.pow(i as u32)) as f64,
            "7" => result += 7.0 * (27u64.pow(i as u32)) as f64,
            "8" => result += 8.0 * (27u64.pow(i as u32)) as f64,
            "9" => result += 9.0 * (27u64.pow(i as u32)) as f64,
            "α" => result += 10.0 * (27u64.pow(i as u32)) as f64,
            "β" => result += 11.0 * (27u64.pow(i as u32)) as f64,
            "γ" => result += 12.0 * (27u64.pow(i as u32)) as f64,
            "δ" => result += 13.0 * (27u64.pow(i as u32)) as f64,
            "ρ" => result += 14.0 * (27u64.pow(i as u32)) as f64,
            "F" => result += 15.0 * (27u64.pow(i as u32)) as f64,
            "η" => result += 16.0 * (27u64.pow(i as u32)) as f64,
            "∅" => result += 17.0 * (27u64.pow(i as u32)) as f64,
            "c" => result += 18.0 * (27u64.pow(i as u32)) as f64,
            "K" => result += 19.0 * (27u64.pow(i as u32)) as f64,
            "ʎ" => result += 20.0 * (27u64.pow(i as u32)) as f64,
            "u" => result += 21.0 * (27u64.pow(i as u32)) as f64,
            "V" => result += 22.0 * (27u64.pow(i as u32)) as f64,
            "Ś" => result += 23.0 * (27u64.pow(i as u32)) as f64,
            "O" => result += 24.0 * (27u64.pow(i as u32)) as f64,
            "π" => result += 25.0 * (27u64.pow(i as u32)) as f64,
            "P" => result += 26.0 * (27u64.pow(i as u32)) as f64,
            _ => {
                return None;
            }
        }
        // println!("from {}", chars_int[i]);
    }

    for i in 0..chars_after.len() {
        match chars_after[i].as_str() {
            "1" => result += 1.0 / (27u64.pow(i as u32 + 1)) as f64,
            "2" => result += 2.0 / (27u64.pow(i as u32 + 1)) as f64,
            "3" => result += 3.0 / (27u64.pow(i as u32 + 1)) as f64,
            "4" => result += 4.0 / (27u64.pow(i as u32 + 1)) as f64,
            "5" => result += 5.0 / (27u64.pow(i as u32 + 1)) as f64,
            "6" => result += 6.0 / (27u64.pow(i as u32 + 1)) as f64,
            "7" => result += 7.0 / (27u64.pow(i as u32 + 1)) as f64,
            "8" => result += 8.0 / (27u64.pow(i as u32 + 1)) as f64,
            "9" => result += 9.0 / (27u64.pow(i as u32 + 1)) as f64,
            "α" => result += 10.0 / (27u64.pow(i as u32 + 1)) as f64,
            "β" => result += 11.0 / (27u64.pow(i as u32 + 1)) as f64,
            "γ" => result += 12.0 / (27u64.pow(i as u32 + 1)) as f64,
            "δ" => result += 13.0 / (27u64.pow(i as u32 + 1)) as f64,
            "ρ" => result += 14.0 / (27u64.pow(i as u32 + 1)) as f64,
            "F" => result += 15.0 / (27u64.pow(i as u32 + 1)) as f64,
            "η" => result += 16.0 / (27u64.pow(i as u32 + 1)) as f64,
            "∅" => result += 17.0 / (27u64.pow(i as u32 + 1)) as f64,
            "c" => result += 18.0 / (27u64.pow(i as u32 + 1)) as f64,
            "K" => result += 19.0 / (27u64.pow(i as u32 + 1)) as f64,
            "ʎ" => result += 20.0 / (27u64.pow(i as u32 + 1)) as f64,
            "u" => result += 21.0 / (27u64.pow(i as u32 + 1)) as f64,
            "V" => result += 22.0 / (27u64.pow(i as u32 + 1)) as f64,
            "Ś" => result += 23.0 / (27u64.pow(i as u32 + 1)) as f64,
            "O" => result += 24.0 / (27u64.pow(i as u32 + 1)) as f64,
            "π" => result += 25.0 / (27u64.pow(i as u32 + 1)) as f64,
            "P" => result += 26.0 / (27u64.pow(i as u32 + 1)) as f64,
            _ => {
                return None;
            }
        }
        // println!("from {}", chars_int[i]);
    }
    if is_below {
        result *= -1.0;
    }
    return Some(result);
}
