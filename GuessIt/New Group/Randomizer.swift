//
//  Randomizer.swift
//  GuessIt
//
//  Created by Виталий Гринчик on 5.08.23.
//

// МОДЕЛЬ: генерирование случайного числа и расчёт количества очков в сравнении с итерацией
// Очки не начисляются, если игрок не угадал половину слайдера: число справа от центра либо слева
struct Randomizer {
    let randomValue = Int.random(in: 0...100)
    
    func getScore(for value: Int) -> Int {
        let delta = abs(value - randomValue)
        if delta < 50 {
            return 100 - 2 * delta
        }
        return 0
    }
}
